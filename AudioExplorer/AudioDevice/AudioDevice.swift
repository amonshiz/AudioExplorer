//
//  AudioDevice.swift
//  AudioExplorer
//
//  Created by Andrew Monshizadeh on 9/5/20.
//

import Foundation
import CoreAudio
import AudioToolbox

public struct AudioDevice {
  let id: AudioDeviceID
}

extension AudioDevice {
  var name: String {
    var namePropertyAddress = AudioObjectPropertyAddress(
      mSelector: AudioObjectPropertySelector(kAudioDevicePropertyDeviceNameCFString),
      mScope: AudioObjectPropertyScope(kAudioObjectPropertyScopeGlobal),
      mElement: AudioObjectPropertyElement(kAudioObjectPropertyElementWildcard))

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


#if DEBUG
import SwiftUI

struct ADPreview: PreviewProvider {
  static var previews: some View {
    let devices = AudioDeviceManager.shared.allDevices

    ForEach(devices.indices) { index in
      VStack {
        Text("\(devices[index].id)")
        Text("\(devices[index].name)")
      }
    }
  }
}
#endif
