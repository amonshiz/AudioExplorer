//
//  AudioDevicePropertyWrapper.swift
//  AudioExplorer
//
//  Created by Andrew Monshizadeh on 9/7/20.
//

import Foundation
import CoreAudio
import OSLog

extension AudioObjectPropertyAddress: CustomStringConvertible {
  public var description: String {
    return "<\(self.mSelector) : \(self.mScope) : \(self.mElement)>"
  }
}

internal struct PropertyProviderFunctions {
  let hasCheck: (AudioObjectID, UnsafePointer<AudioObjectPropertyAddress>) -> Bool
  let dataSize: (AudioObjectID, UnsafePointer<AudioObjectPropertyAddress>, UInt32, UnsafeRawPointer?, UnsafeMutablePointer<UInt32>) -> OSStatus
  let getData: (AudioObjectID, UnsafePointer<AudioObjectPropertyAddress>, UInt32, UnsafeRawPointer?, UnsafeMutablePointer<UInt32>, UnsafeMutableRawPointer) -> OSStatus
  let isSettable: (AudioObjectID, UnsafePointer<AudioObjectPropertyAddress>, UnsafeMutablePointer<DarwinBoolean>) -> OSStatus
  let setData: (AudioObjectID, UnsafePointer<AudioObjectPropertyAddress>, UInt32, UnsafeRawPointer?, UInt32, UnsafeRawPointer) -> OSStatus

  let noErrorValue: OSStatus

  static let standard = PropertyProviderFunctions(
    hasCheck: AudioObjectHasProperty,
    dataSize: AudioObjectGetPropertyDataSize,
    getData: AudioObjectGetPropertyData,
    isSettable: AudioObjectIsPropertySettable,
    setData: AudioObjectSetPropertyData,
    noErrorValue: kAudioHardwareNoError)
}

struct PropertyDataDecoder<Input, Output> {
  private let impl: (UnsafeMutablePointer<Input>, Int) -> Output?

  func decode(_ input: UnsafeMutablePointer<Input>, count: Int) -> Output? {
    return impl(input, count)
  }

  static func single() -> PropertyDataDecoder<Input, Output> {
    return PropertyDataDecoder { input, _ in
      let pointee = input.pointee
      return pointee as? Output
    }
  }

  static func array() -> PropertyDataDecoder<Input, Output> where Output == Array<Input> {
    return PropertyDataDecoder { input, capacity in
      let pointer = UnsafeMutableRawPointer(input)
      let bound = pointer.bindMemory(to: Output.Element.self, capacity: capacity)
      return Array(UnsafeBufferPointer(start: bound, count: capacity))
    }
  }

  func callAsFunction(input: UnsafeMutablePointer<Input>, count: Int) -> Output? {
    return decode(input, count: count)
  }
}

@propertyWrapper class DeviceProperty<Base, Output> {

  var id: AudioObjectID = 0
  internal let description: AudioDevicePropertyDescription<Base>
  internal let providers: PropertyProviderFunctions
  internal let decoder: PropertyDataDecoder<Base, Output>

  internal let logger = Logger(subsystem: "com.amonshiz.audioexplorer.deviceproperty", category: "error")

  init(
    _ description: AudioDevicePropertyDescription<Base>,
    providers functions: PropertyProviderFunctions = .standard,
    as decoder: PropertyDataDecoder<Base, Output> = .single()
  ) {
    self.description = description
    self.providers = functions
    self.decoder = decoder
  }

  var wrappedValue: Output? {
    get {
      var address = description.address
      guard providers.hasCheck(id, &address) else {
        logger.error("property for address not available \(address, privacy: .public)")
        return nil
      }

      var propertySize: UInt32 = 0
      let sizeStatus = providers.dataSize(
        id,
        &address,
        0, nil,
        &propertySize)

      guard sizeStatus == providers.noErrorValue else {
        logger.error("unable to get size for address \(address, privacy: .public)")
        return nil
      }

      let propertyCount = Int(propertySize / description.elementSize)
      let holder = UnsafeMutablePointer<Base>.allocate(capacity: propertyCount)
      let accessStatus = providers.getData(
        id,
        &address,
        0, nil,
        &propertySize,
        holder)

      guard accessStatus == providers.noErrorValue else {
        logger.error("unable to access address \(address, privacy: .public)")
        return nil
      }

      return decoder(input: holder, count: propertyCount)
    }
  }
}

@propertyWrapper class MutableDeviceProperty<Base, Output>: DeviceProperty<Base, Output> {

  override var wrappedValue: Output? {
    get { super.wrappedValue }
    set {
      var address = description.address
      guard providers.hasCheck(id, &address) else {
        logger.error("property for address not available \(address, privacy: .public)")
        return
      }

      var isSettable: DarwinBoolean = false
      let isSettableStatus = providers.isSettable(id, &address, &isSettable)

      guard isSettableStatus == providers.noErrorValue && isSettable.boolValue else {
        logger.error("unable to set value for address \(address, privacy: .public)")
        return
      }

      let typeSize = description.elementSize
      var newValueCopy = newValue

      let didSet = providers.setData(
        id,
        &address,
        0, nil,
        typeSize,
        &newValueCopy
        )

      guard didSet == providers.noErrorValue else {
        logger.error("unable to set value \(newValue as! NSObject, privacy: .public) for address \(address, privacy: .public)")
        return
      }
    }
  }
}
