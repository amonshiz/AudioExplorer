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

  var defaultInput: AudioDevice { get set }
  var defaultOutput: AudioDevice { get set }
}

public class AudioDeviceManager {
  public static let shared = AudioDeviceManager()

  @DeviceProperty(.allDevices, as: .array()) private var allDeviceIds: [AudioDeviceID]?
  @MutableDeviceProperty(.defaultInput) private var defaultInputId: AudioDeviceID?
  @MutableDeviceProperty(.defaultOutput) private var defaultOutputId: AudioDeviceID?

  private init() {
    let systemObject = AudioDeviceID(kAudioObjectSystemObject)
    _allDeviceIds.id = systemObject
    _defaultInputId.id = systemObject
    _defaultOutputId.id = systemObject
  }
}

extension AudioDeviceManager: DeviceProvider {
  public var allDevices: [AudioDevice] {
    get {
      (allDeviceIds ?? [0]).compactMap(AudioDevice.init(id:))
    }
  }

  public var defaultInput: AudioDevice {
    get {
      guard let id = self.defaultInputId else { fatalError("No default input found") }
      return AudioDevice(id: id)
    }

    set {
      self.defaultInputId = newValue.id
    }
  }

  public var defaultOutput: AudioDevice {
    get {
      guard let id = self.defaultOutputId else { fatalError("No default output found") }
      return AudioDevice(id: id)
    }

    set {
      self.defaultOutputId = newValue.id
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

      Text("default input \(m.defaultInput.id)")
      Text("default output \(m.defaultOutput.id)")
    }
  }
}
#endif
