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

  var defaultInput: AudioDevice? { get }
  var defaultOutput: AudioDevice? { get }
}

public class AudioDeviceManager {
  public static let shared = AudioDeviceManager()

  @DeviceProperty(.defaultInput) private var defaultInputId: AudioDeviceID?
  @DeviceProperty(.defaultOutput) private var defaultOutputId: AudioDeviceID?

  private init() {
    _defaultInputId.id = AudioDeviceID(kAudioObjectSystemObject)
    _defaultOutputId.id = AudioDeviceID(kAudioObjectSystemObject)
  }
}

extension AudioDeviceManager: DeviceProvider {
  public var allDevices: [AudioDevice] {
    get {
      var devicesPropertyAddress = AudioObjectPropertyAddress(
        mSelector: kAudioHardwarePropertyDevices,
        mScope: kAudioObjectPropertyScopeGlobal,
        mElement: kAudioObjectPropertyElementMaster)

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

  public var defaultInput: AudioDevice? {
    guard let id = self.defaultInputId else { return nil }
    return AudioDevice(id: id)
  }

  public var defaultOutput: AudioDevice? {
    guard let id = self.defaultOutputId else { return nil }
    return AudioDevice(id: id)
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

      Text("default input \(m.defaultInput?.id ?? 0)")
      Text("default output \(m.defaultOutput?.id ?? 0)")
    }
  }
}
#endif
