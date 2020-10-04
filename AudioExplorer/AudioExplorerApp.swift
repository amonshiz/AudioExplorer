//
//  AudioExplorerApp.swift
//  AudioExplorer
//
//  Created by Andrew Monshizadeh on 9/5/20.
//

import SwiftUI

@main
struct AudioExplorerApp: App {
  var defaultInput = Binding<AudioDevice> {
    AudioDeviceManager.shared.defaultInput
  } set: { (device) in
    AudioDeviceManager.shared.defaultInput = device
  }

  var defaultOutput = Binding<AudioDevice> {
    AudioDeviceManager.shared.defaultOutput
  } set: { (device) in
    AudioDeviceManager.shared.defaultOutput = device
  }

  var body: some Scene {
    WindowGroup {
//      ContentView()
      BasicRoutingView(
        allDevices: AudioDeviceManager.shared.allDevices,
        currentInput: defaultInput,
        currentOutput: defaultOutput)
    }
  }
}
