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
}

extension AudioDevice {
  private func supports(configuration: AudioDeviceProperty) -> Bool {
    var configurationAddress = configuration.address

    var configurationPropertySize: UInt32 = 0
    let configurationPropertySizeStatus = AudioObjectGetPropertyDataSize(
      self.id,
      &configurationAddress,
      0, nil,
      &configurationPropertySize)

    guard configurationPropertySizeStatus == kAudioHardwareNoError else {
      fatalError("unable to determine size of streams property")
    }

    let bufferList = AudioBufferList.allocate(maximumBuffers: Int(configurationPropertySize))
    let bufferListStatus = AudioObjectGetPropertyData(
      self.id,
      &configurationAddress,
      0, nil,
      &configurationPropertySize,
      bufferList.unsafeMutablePointer)

    guard bufferListStatus == kAudioHardwareNoError else {
      fatalError("unable to fill buffer list")
    }

    let bufferListPointee = bufferList.unsafeMutablePointer.pointee

    for index in 0 ..< bufferListPointee.mNumberBuffers {
      let buffer = bufferList[Int(index)]
      return buffer.mNumberChannels > 0
    }

    return false
  }

  var input: Bool { supports(configuration: AudioDeviceProperty.StreamConfiguration.input) }
  var output: Bool { supports(configuration: AudioDeviceProperty.StreamConfiguration.output) }
}

struct AudioDeviceProperty {
  let selector: AudioObjectPropertySelector
  let scope: AudioObjectPropertyScope
  let element: AudioObjectPropertyElement

  private init(selector se: AudioObjectPropertySelector, scope sc: AudioObjectPropertyScope, element el: AudioObjectPropertyElement) {
    selector = se
    scope = sc
    element = el
  }

  var address: AudioObjectPropertyAddress {
    AudioObjectPropertyAddress(mSelector: selector, mScope: scope, mElement: element)
  }
}

extension AudioDeviceProperty {
  static var name: AudioDeviceProperty =
    AudioDeviceProperty(
      selector: kAudioDevicePropertyDeviceNameCFString,
      scope: kAudioObjectPropertyScopeGlobal,
      element: kAudioObjectPropertyElementWildcard)

  static var iconURL = AudioDeviceProperty(
    selector: kAudioDevicePropertyIcon,
    scope: kAudioObjectPropertyScopeGlobal,
    element: kAudioObjectPropertyElementWildcard)

  enum StreamConfiguration {
    static var input = AudioDeviceProperty(
      selector: kAudioDevicePropertyStreamConfiguration,
      scope: kAudioDevicePropertyScopeInput,
      element: kAudioObjectPropertyElementWildcard)

    static var output = AudioDeviceProperty(
      selector: kAudioDevicePropertyStreamConfiguration,
      scope: kAudioDevicePropertyScopeOutput,
      element: kAudioObjectPropertyElementWildcard)
  }
}

extension AudioDevice {
  var name: String {
    var namePropertyAddress = AudioDeviceProperty.name.address

    var nameSize: UInt32 = 0
    let nameSizeStatus = AudioObjectGetPropertyDataSize(
      self.id,
      &namePropertyAddress,
      0, nil, /* NO IDEA */
      &nameSize)

    guard nameSizeStatus == kAudioServicesNoError else {
      fatalError("unable to get size of name: \(nameSizeStatus)")
    }

    var cfStringSize = UInt32(MemoryLayout<CFString>.size)
    var nameCFString: Unmanaged<CFString>?
    let nameStatus = AudioObjectGetPropertyData(
      self.id,
      &namePropertyAddress,
      0, nil, /* NO IDEA */
      &cfStringSize,
      &nameCFString)

    guard nameStatus == kAudioServicesNoError else {
      fatalError("unable to get name: \(nameStatus)")
    }

    return nameCFString?.takeRetainedValue() as String? ?? "UNKNOWN"
  }
}

extension AudioDevice {
  var imageURL: URL? {
    var imageURLPropertyAddress = AudioDeviceProperty.iconURL.address

    guard AudioObjectHasProperty(self.id, &imageURLPropertyAddress) else {
      print("image property not available")
      return nil
    }

    var imageURLSize: UInt32 = 0
    let imageURLSizeStatus = AudioObjectGetPropertyDataSize(
      self.id,
      &imageURLPropertyAddress,
      0, nil, /* NO IDEA */
      &imageURLSize)

    guard imageURLSizeStatus == kAudioServicesNoError else {
      fatalError("unable to get size of imageURL: \(imageURLSizeStatus)")
    }

    var cfURLSize = UInt32(MemoryLayout<CFURL>.size)
    var imageCFURL: Unmanaged<CFURL>?
    let imageURLStatus = AudioObjectGetPropertyData(
      self.id,
      &imageURLPropertyAddress,
      0, nil, /* NO IDEA */
      &cfURLSize,
      &imageCFURL)

    guard imageURLStatus == kAudioServicesNoError else {
      fatalError("unable to get name: \(imageURLStatus)")
    }

    return imageCFURL?.takeRetainedValue() as URL?
  }

  var image: NSImage? {
    if let url = imageURL {
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
        Text("\(devices[index].name)")
        if let image = devices[index].image {
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
