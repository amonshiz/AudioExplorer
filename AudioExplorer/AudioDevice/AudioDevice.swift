//
//  AudioDevice.swift
//  AudioExplorer
//
//  Created by Andrew Monshizadeh on 9/5/20.
//

import Foundation
import AppKit
import CoreAudio
import CoreAudioTypes
import AudioToolbox

public struct AudioDevice {
  let id: AudioDeviceID

  @DeviceProperty(.name) var name: String?
  @DeviceProperty(.iconURL) var iconURL: URL?

  init(id: AudioDeviceID) {
    self.id = id

    _name.id = id
    _iconURL.id = id
  }
}

extension AudioDevice {
  func configuration(for scope: AudioDevicePropertyDescription<UnsafeMutableAudioBufferListPointer>) -> UnsafeMutableAudioBufferListPointer {
    var configurationAddress = scope.address

    var configurationPropertySize: UInt32 = 0
    let configurationPropertySizeStatus = AudioObjectGetPropertyDataSize(
      self.id,
      &configurationAddress,
      0, nil,
      &configurationPropertySize)

    guard configurationPropertySizeStatus == kAudioHardwareNoError else {
      fatalError("unable to determine size of streams property")
    }

    let numberOfBuffers = configurationPropertySize / scope.elementSize
    let bufferList = AudioBufferList.allocate(maximumBuffers: Int(numberOfBuffers))
    let bufferListStatus = AudioObjectGetPropertyData(
      self.id,
      &configurationAddress,
      0, nil,
      &configurationPropertySize,
      bufferList.unsafeMutablePointer)

    guard bufferListStatus == kAudioHardwareNoError else {
      fatalError("unable to fill buffer list")
    }

    return bufferList
  }

  private func supports(configuration: AudioDevicePropertyDescription<UnsafeMutableAudioBufferListPointer>) -> Bool {
    let bufferList = self.configuration(for: configuration)
    for index in 0 ..< bufferList.unsafeMutablePointer.pointee.mNumberBuffers {
      let buffer = bufferList[Int(index)]
      return buffer.mNumberChannels > 0
    }

    return false
  }

  var input: Bool { supports(configuration: AudioDevicePropertyDescription.StreamConfiguration.input) }
  var output: Bool { supports(configuration: AudioDevicePropertyDescription.StreamConfiguration.output) }
}

extension AudioDevice {
  var icon: NSImage? {
    if let url = iconURL {
      return NSImage(contentsOf: url)
    }

    return nil
  }
}


#if DEBUG
import SwiftUI

struct ADPreview: PreviewProvider {
  static var previews: some View {
    let devices = AudioDeviceManager.shared.allDevices

    ForEach(devices.indices) { index in
      VStack {
        Text("\(devices[index].id)")
        Text("\(devices[index].name ?? "MISSING")")
        if let image = devices[index].icon {
          Image(nsImage: image)
        }
        if devices[index].input {
          Text("Has Input")
        }
        if devices[index].output {
          Text("Has Output")
        }
      }
    }
  }
}
#endif
