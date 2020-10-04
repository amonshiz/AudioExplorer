//
//  AudioExplorerApp.swift
//  AudioExplorer
//
//  Created by Andrew Monshizadeh on 9/5/20.
//

import SwiftUI

@main
struct AudioExplorerApp: App {
  var body: some Scene {
    WindowGroup {
//      ContentView()
      BasicRoutingView(
        allDevices: AudioDeviceManager.shared.allDevices,
        currentInput: AudioDeviceManager.shared.defaultInput,
        currentOutput: AudioDeviceManager.shared.defaultOutput)
    }
  }
}
