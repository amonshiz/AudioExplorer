//
//  AudioDeviceManager.swift
//  AudioExplorer
//
//  Created by Andrew Monshizadeh on 9/5/20.
//

import Foundation
import CoreAudio
import AudioToolbox

public protocol DeviceProvider {
  var allDevices: [AudioDevice] { get }
}

public class AudioDeviceManager {
  public static let shared = AudioDeviceManager()
}

extension AudioDeviceManager: DeviceProvider {
  public var allDevices: [AudioDevice] {
    get {
      var devicesPropertyAddress = AudioObjectPropertyAddress(
        mSelector: AudioObjectPropertySelector(kAudioHardwarePropertyDevices),
        mScope: AudioObjectPropertyScope(kAudioObjectPropertyScopeGlobal),
        mElement: AudioObjectPropertyElement(kAudioObjectPropertyElementWildcard))

      var numberOfDevicesSize: UInt32 = 0
      let devicesSizeStatus = AudioObjectGetPropertyDataSize(
        AudioObjectID(kAudioObjectSystemObject),
        &devicesPropertyAddress,
        0, nil, /* NO IDEA */
        &numberOfDevicesSize)

      guard devicesSizeStatus == kAudioServicesNoError else {
        fatalError("unable to get size of all device ids: \(devicesSizeStatus)")
      }

      let numberOfDevices = Int(numberOfDevicesSize / UInt32(MemoryLayout<AudioDeviceID>.size))
      var rawDeviceIDs = Array(repeating: UInt32(0), count: numberOfDevices)

      let deviceIDsStatus = AudioObjectGetPropertyData(
        AudioObjectID(kAudioObjectSystemObject),
        &devicesPropertyAddress,
        0, nil,
        &numberOfDevicesSize,
        &rawDeviceIDs)

      guard deviceIDsStatus == kAudioServicesNoError else {
        fatalError("unable to get device ids: \(deviceIDsStatus)")
      }

      let devices = rawDeviceIDs.map(AudioDevice.init(id:))
      return devices
    }
  }
}

#if DEBUG
import SwiftUI

struct ADMPreviewProvider: PreviewProvider {
  static var previews: some View {
    let m = AudioDeviceManager.shared
    let devices = m.allDevices

    VStack {
      ForEach(devices.indices) {
        Text("\(devices[$0].id)")
      }
    }
  }
}
#endif
