//
//  DevicePicker.swift
//  AudioExplorer
//
//  Created by Andrew Monshizadeh on 9/19/20.
//

import SwiftUI

struct DevicePicker: View {
  @State var selected: AudioDevice.ID
  var selectedDevice: AudioDevice? {
    get {
      availableDevices.first { $0.id == selected }
    }
  }
  let availableDevices: [AudioDevice]

  init(availableDevices: [AudioDevice]) {
    assert(availableDevices.count > 0)
    self.availableDevices = availableDevices
    self._selected = State(initialValue: self.availableDevices.first!.id)
  }

  var body: some View {
    Picker(selection: $selected, label: Text("Device")) {
      ForEach(availableDevices) {
        Text("\($0.name ?? "")").id($0)
      }
    }
    Text("selected \(selectedDevice?.name ?? "")")
  }
}

struct DevicePicker_Previews: PreviewProvider {
  static var previews: some View {
    DevicePicker(availableDevices: [
      AudioDevice(id: 1)
    ])
  }
}
