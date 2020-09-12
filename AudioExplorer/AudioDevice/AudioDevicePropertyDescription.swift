//
//  AudioDevicePropertyDescription.swift
//  AudioExplorer
//
//  Created by Andrew Monshizadeh on 9/7/20.
//

import CoreAudio

protocol PropertyRawValuable {
  associatedtype Value
  var value: Value { get }
}

extension AudioDevice {
  enum Property {
    struct Selector: PropertyRawValuable {
      let value: AudioObjectPropertySelector
      private init(_ v: AudioObjectPropertySelector) {
        value = v
      }

      static var nameCFString = Selector(kAudioDevicePropertyDeviceNameCFString)
      static var icon = Selector(kAudioDevicePropertyIcon)
      static var streamConfiguration = Selector(kAudioDevicePropertyStreamConfiguration)
    }

    struct Scope: PropertyRawValuable {
      let value: AudioObjectPropertyScope
      private init(_ v: AudioObjectPropertyScope) {
        value = v
      }

      static var global = Scope(kAudioObjectPropertyScopeGlobal)
      static var input = Scope(kAudioObjectPropertyScopeInput)
      static var output = Scope(kAudioObjectPropertyScopeOutput)
    }

    struct Element: PropertyRawValuable {
      let value: AudioObjectPropertyElement
      private init(_ v: AudioObjectPropertyElement) {
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

  fileprivate init(selector se: AudioDevice.Property.Selector, scope sc: AudioDevice.Property.Scope, element el: AudioDevice.Property.Element) {
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

