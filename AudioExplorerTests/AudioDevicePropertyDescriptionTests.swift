//
//  AudioDevicePropertyDescriptionTests.swift
//  AudioExplorerTests
//
//  Created by Andrew Monshizadeh on 9/12/20.
//

import XCTest
import CoreAudio
@testable import AudioExplorer

class AudioDevicePropertyDescriptionTests: XCTestCase {
  private func validate<V: RawRepresentable,T>(pairs: [(V, T)]) where V.RawValue == T, T: Equatable {
    for pair in pairs {
      XCTAssertEqual(pair.0.rawValue, pair.1)
    }
  }

  func testSelectorStaticsAreExpectedValues() throws {
    let selectorPairs: [(AudioDevice.Property.Selector, AudioObjectPropertySelector)] = [
      (.icon, kAudioDevicePropertyIcon),
      (.nameCFString, kAudioDevicePropertyDeviceNameCFString),
      (.streamConfiguration, kAudioDevicePropertyStreamConfiguration)
    ]
    validate(pairs: selectorPairs)
  }

  func testScopeStaticsAreExpectedValues() throws {
    let scopePairs: [(AudioDevice.Property.Scope, AudioObjectPropertyScope)] = [
      (.global, kAudioObjectPropertyScopeGlobal),
      (.input, kAudioDevicePropertyScopeInput),
      (.output, kAudioDevicePropertyScopeOutput)
    ]
    validate(pairs: scopePairs)
  }

  func testElementStaticsAreExpectedValues() throws {
    let elementPairs: [(AudioDevice.Property.Element, AudioObjectPropertyElement)] = [
      (.wildcard, kAudioObjectPropertyElementWildcard)
    ]
    validate(pairs: elementPairs)
  }

  func testNameCFStringAddress() throws {
    let nameDescription = AudioDevicePropertyDescription.name
    let nameAddress = nameDescription.address

    let expectedAddress = AudioObjectPropertyAddress(mSelector: kAudioDevicePropertyDeviceNameCFString, mScope: kAudioObjectPropertyScopeGlobal, mElement: kAudioObjectPropertyElementWildcard)

    XCTAssertEqual(nameAddress.mSelector, expectedAddress.mSelector)
    XCTAssertEqual(nameAddress.mScope, expectedAddress.mScope)
    XCTAssertEqual(nameAddress.mElement, expectedAddress.mElement)
  }
}
