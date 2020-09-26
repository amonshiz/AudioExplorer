//
//  ContentView.swift
//  AudioExplorer
//
//  Created by Andrew Monshizadeh on 9/5/20.
//

import SwiftUI

struct ContentView: View {
  var body: some View {
    let devices = AudioDeviceManager.shared.allDevices

    DevicePicker(availableDevices: devices, label: Text("All devices"))
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
