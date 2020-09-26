//
//  DevicePicker.swift
//  AudioExplorer
//
//  Created by Andrew Monshizadeh on 9/19/20.
//

import SwiftUI

struct DevicePicker<Label>: View where Label: View {
  @State var selected: AudioDevice.ID
  var selectedDevice: AudioDevice? {
    get {
      availableDevices.first { $0.id == selected }
    }
  }

  let availableDevices: [AudioDevice]
  let label: Label
  private let debugging: Bool

  init(availableDevices: [AudioDevice], label: Label, debugging: Bool = false) {
    assert(availableDevices.count > 0)
    self.debugging = debugging
    self.label = label
    self.availableDevices = availableDevices
    self._selected = State(initialValue: self.availableDevices.first!.id)
  }

  var body: some View {
    Picker(selection: $selected, label: label) {
      ForEach(availableDevices) {
        Text("\($0.name ?? "")").id($0)
      }
    }
    .pickerStyle(MenuPickerStyle())
    if debugging {
      Text("selected \(selectedDevice?.name ?? "")")
    }
  }
}

struct DevicePicker_Previews: PreviewProvider {
  static var previews: some View {
    DevicePicker(availableDevices: [
      AudioDevice(id: 1)
    ], label: Text("Preview"))
  }
}
