//
//  AudioDevicePropertyWrapper.swift
//  AudioExplorer
//
//  Created by Andrew Monshizadeh on 9/7/20.
//

import Foundation
import CoreAudio

@propertyWrapper struct Property<Base: AnyObject, Output> {
  var id: AudioObjectID = 0
  private var description: AudioDevicePropertyDescription<Base>

  init(_ description: AudioDevicePropertyDescription<Base>) {
    self.description = description
  }

  var wrappedValue: Output? {
    get {
      var address = description.address
      guard AudioObjectHasProperty(id, &address) else {
        print("property for address not available \(address)")
        return nil
      }

      var propertySize: UInt32 = 0
      let sizeStatus = AudioObjectGetPropertyDataSize(
        id,
        &address,
        0, nil,
        &propertySize)

      guard sizeStatus == kAudioHardwareNoError else {
        print("unable to get size for address \(address)")
        return nil
      }

      var typeSize = description.elementSize
      var holder: Unmanaged<Base>?
      let accessStatus = AudioObjectGetPropertyData(
        id,
        &address,
        0, nil,
        &typeSize,
        &holder)

      guard accessStatus == kAudioHardwareNoError else {
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
