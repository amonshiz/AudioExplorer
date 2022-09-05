//
//  AudioExplorerApp.swift
//  AudioExplorer
//
//  Created by Andrew Monshizadeh on 9/5/20.
//

import SwiftUI

@main
struct AudioExplorerApp: App {
  @State var defaultInput = AudioDeviceManager.shared.defaultInput.id
  @State var defaultOutput = AudioDeviceManager.shared.defaultOutput.id

  var body: some Scene {
    WindowGroup {
      BasicRoutingView(
        allDevices: AudioDeviceManager.shared.allDevices,
        currentInput: .init(get: {
          defaultInput
        }, set: { newID in
          AudioDeviceManager.shared.defaultInput = AudioDeviceManager.shared.allDevices.first { $0.id == newID }!
          defaultInput = newID
        }),
        currentOutput: .init(get: {
          defaultOutput
        }, set: { newID in
          AudioDeviceManager.shared.defaultOutput = AudioDeviceManager.shared.allDevices.first { $0.id == newID }!
          defaultOutput = newID
        })
      )
    }
  }
}
