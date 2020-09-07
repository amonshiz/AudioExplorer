//
//  AudioDevice.swift
//  AudioExplorer
//
//  Created by Andrew Monshizadeh on 9/5/20.
//

import Foundation
import CoreAudio
import CoreAudioTypes
import AudioToolbox

public struct AudioDevice {
  let id: AudioDeviceID

  private func property<T>(for description: AudioDevicePropertyDescription<T>) -> T? where T: AnyObject {
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
    var holder: Unmanaged<T>?
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

    return holder?.takeRetainedValue() as T?
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

  var input: Bool { supports(configuration: AudioDeviceProperty.StreamConfiguration.input) }
  var output: Bool { supports(configuration: AudioDeviceProperty.StreamConfiguration.output) }
}

extension AudioDevice {
  var name: String? { property(for: AudioDeviceProperty.name) as String? }
}

extension AudioDevice {
  var iconURL: URL? { property(for: AudioDeviceProperty.iconURL) as URL? }
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
