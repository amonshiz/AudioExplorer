//
//  AudioDevicePropertyDescription.swift
//  AudioExplorer
//
//  Created by Andrew Monshizadeh on 9/7/20.
//

import CoreAudio

extension AudioDevice {
  enum Property {
    struct Selector: RawRepresentable {
      var rawValue: AudioObjectPropertySelector { value }
      init?(rawValue: AudioObjectPropertySelector) {
        self.init(rawValue)
      }

      internal let value: RawValue
      internal init(_ v: AudioObjectPropertySelector) {
        value = v
      }

      static var nameCFString = Selector(kAudioDevicePropertyDeviceNameCFString)
      static var icon = Selector(kAudioDevicePropertyIcon)
      static var streamConfiguration = Selector(kAudioDevicePropertyStreamConfiguration)

      static var defaultInput = Selector(kAudioHardwarePropertyDefaultInputDevice)
      static var defaultOutput = Selector(kAudioHardwarePropertyDefaultOutputDevice)

      static var allDevices = Selector(kAudioHardwarePropertyDevices)
    }

    struct Scope: RawRepresentable {
      var rawValue: AudioObjectPropertyScope { value }
      init?(rawValue: AudioObjectPropertyScope) {
        self.init(rawValue)
      }

      internal let value: AudioObjectPropertyScope
      internal init(_ v: AudioObjectPropertyScope) {
        value = v
      }

      static var global = Scope(kAudioObjectPropertyScopeGlobal)
      static var input = Scope(kAudioObjectPropertyScopeInput)
      static var output = Scope(kAudioObjectPropertyScopeOutput)
    }

    struct Element: RawRepresentable {
      var rawValue: AudioObjectPropertyElement { value }
      init?(rawValue: AudioObjectPropertyElement) {
        self.init(rawValue)
      }

      internal let value: AudioObjectPropertyElement
      internal init(_ v: AudioObjectPropertyElement) {
        value = v
      }

      static var wildcard = Element(kAudioObjectPropertyElementWildcard)
    }
  }
}

struct AudioDevicePropertyDescription<Element> {
  let selector: AudioDevice.Property.Selector
  let scope: AudioDevice.Property.Scope
  let element: AudioDevice.Property.Element
  let elementType: Element.Type
  let elementSize: UInt32

  internal init(selector se: AudioDevice.Property.Selector, scope sc: AudioDevice.Property.Scope, element el: AudioDevice.Property.Element) {
    selector = se
    scope = sc
    element = el
    elementType = Element.self
    elementSize = UInt32(MemoryLayout<Element>.size)
  }

  var address: AudioObjectPropertyAddress {
    AudioObjectPropertyAddress(mSelector: selector.value, mScope: scope.value, mElement: element.value)
  }
}

extension AudioDevicePropertyDescription where Element == AudioDeviceID {
  static var defaultInput = AudioDevicePropertyDescription(
    selector: .defaultInput,
    scope: .global,
    element: .wildcard)

  static var defaultOutput = AudioDevicePropertyDescription(
    selector: .defaultOutput,
    scope: .global,
    element: .wildcard)

  static var allDevices = AudioDevicePropertyDescription(
    selector: .allDevices,
    scope: .global,
    element: .wildcard)
}

extension AudioDevicePropertyDescription where Element == CFString {
  static var name = AudioDevicePropertyDescription(
    selector: .nameCFString,
    scope: .global,
    element: .wildcard)
}

extension AudioDevicePropertyDescription where Element == CFURL {
  static var iconURL = AudioDevicePropertyDescription(
    selector: .icon,
    scope: .global,
    element: .wildcard)
}

extension AudioDevicePropertyDescription where Element == UnsafeMutableAudioBufferListPointer {
  enum StreamConfiguration {
    static var input = AudioDevicePropertyDescription<UnsafeMutableAudioBufferListPointer>(
      selector: .streamConfiguration,
      scope: .input,
      element: .wildcard)

    static var output = AudioDevicePropertyDescription<UnsafeMutableAudioBufferListPointer>(
      selector: .streamConfiguration,
      scope: .output,
      element: .wildcard)
  }
}

