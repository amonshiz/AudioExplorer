//
//  AudioDevicePropertyDescription.swift
//  AudioExplorer
//
//  Created by Andrew Monshizadeh on 9/7/20.
//

import CoreAudio

struct AudioDevicePropertyDescription<Element> {
  let selector: AudioObjectPropertySelector
  let scope: AudioObjectPropertyScope
  let element: AudioObjectPropertyElement
  let elementType: Element.Type
  let elementSize: UInt32

  fileprivate init(selector se: AudioObjectPropertySelector, scope sc: AudioObjectPropertyScope, element el: AudioObjectPropertyElement) {
    selector = se
    scope = sc
    element = el
    elementType = Element.self
    elementSize = UInt32(MemoryLayout<Element>.size)
  }

  var address: AudioObjectPropertyAddress {
    AudioObjectPropertyAddress(mSelector: selector, mScope: scope, mElement: element)
  }
}

enum AudioDeviceProperty {
  static var name = AudioDevicePropertyDescription<CFString>(
    selector: kAudioDevicePropertyDeviceNameCFString,
    scope: kAudioObjectPropertyScopeGlobal,
    element: kAudioObjectPropertyElementWildcard)

  static var iconURL = AudioDevicePropertyDescription<CFURL>(
    selector: kAudioDevicePropertyIcon,
    scope: kAudioObjectPropertyScopeGlobal,
    element: kAudioObjectPropertyElementWildcard)

  enum StreamConfiguration {
    static var input = AudioDevicePropertyDescription<UnsafeMutableAudioBufferListPointer>(
      selector: kAudioDevicePropertyStreamConfiguration,
      scope: kAudioDevicePropertyScopeInput,
      element: kAudioObjectPropertyElementWildcard)

    static var output = AudioDevicePropertyDescription<UnsafeMutableAudioBufferListPointer>(
      selector: kAudioDevicePropertyStreamConfiguration,
      scope: kAudioDevicePropertyScopeOutput,
      element: kAudioObjectPropertyElementWildcard)
  }
}

