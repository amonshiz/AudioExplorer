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

  let noErrorValue: OSStatus

  static let standard = PropertyProviderFunctions(
    hasCheck: AudioObjectHasProperty,
    dataSize: AudioObjectGetPropertyDataSize,
    getData: AudioObjectGetPropertyData,
    noErrorValue: kAudioHardwareNoError)
}


@propertyWrapper struct DeviceProperty<Base, Output> {

  var id: AudioObjectID = 0
  private let description: AudioDevicePropertyDescription<Base>
  private let providers: PropertyProviderFunctions

  private let logger = Logger(subsystem: "com.amonshiz.audioexplorer.deviceproperty", category: "error")

  init(_ description: AudioDevicePropertyDescription<Base>, providers functions: PropertyProviderFunctions = .standard) {
    self.description = description
    self.providers = functions
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

      let propertyCount = propertySize / description.elementSize
      var typeSize = description.elementSize
      let holder = UnsafeMutablePointer<Base>.allocate(capacity: Int(propertyCount))
      let accessStatus = providers.getData(
        id,
        &address,
        0, nil,
        &typeSize,
        holder)

      guard accessStatus == providers.noErrorValue else {
        logger.error("unable to access address \(address, privacy: .public)")
        return nil
      }

      let hPointee = holder.pointee
      return hPointee as? Output
    }
  }
}
