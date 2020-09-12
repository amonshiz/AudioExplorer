//
//  AudioDevicePropertyWrapper.swift
//  AudioExplorer
//
//  Created by Andrew Monshizadeh on 9/7/20.
//

import Foundation
import CoreAudio

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


@propertyWrapper struct DeviceProperty<Base: AnyObject, Output> {

  var id: AudioObjectID = 0
  private let description: AudioDevicePropertyDescription<Base>
  private let providers: PropertyProviderFunctions

  init(_ description: AudioDevicePropertyDescription<Base>, providers functions: PropertyProviderFunctions = .standard) {
    self.description = description
    self.providers = functions
  }

  var wrappedValue: Output? {
    get {
      var address = description.address
      guard providers.hasCheck(id, &address) else {
        print("property for address not available \(address)")
        return nil
      }

      var propertySize: UInt32 = 0
      let sizeStatus = providers.dataSize(
        id,
        &address,
        0, nil,
        &propertySize)

      guard sizeStatus == providers.noErrorValue else {
        print("unable to get size for address \(address)")
        return nil
      }

      var typeSize = description.elementSize
      var holder: Unmanaged<Base>?
      let accessStatus = providers.getData(
        id,
        &address,
        0, nil,
        &typeSize,
        &holder)

      guard accessStatus == providers.noErrorValue else {
        print("unable to access address \(address)")
        return nil
      }

      if let h = holder?.takeRetainedValue() {
        return h as? Output
      }
      return nil

    }
  }
}
