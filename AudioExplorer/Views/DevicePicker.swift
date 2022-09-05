//
//  DevicePicker.swift
//  AudioExplorer
//
//  Created by Andrew Monshizadeh on 9/19/20.
//

import SwiftUI

struct DevicePicker<Label>: View where Label: View {
  let availableDevices: [AudioDevice]
  let label: Label
  private let debugging: Bool

  @Binding var selectedDevice: AudioDevice.ID

  init(availableDevices: [AudioDevice], preselected: Binding<AudioDevice.ID>, label: Label, debugging: Bool = true) {
    assert(availableDevices.count > 0)
    self.debugging = debugging
    self.label = label
    self.availableDevices = availableDevices
    _selectedDevice = preselected
  }

  var body: some View {
    VStack {
      Picker(selection: $selectedDevice, label: label) {
        ForEach(availableDevices) { d in
          Text(d.name ?? "NO NAME").tag(d.id)
        }
      }
      .pickerStyle(MenuPickerStyle())
      if debugging {
        Text("Selected by device: \(availableDevices.first(where: { $0.id == selectedDevice })?.name ?? "")")
      }
    }
  }
}

struct DevicePicker_Previews: PreviewProvider {
  static var previews: some View {
    DevicePicker(availableDevices: [AudioDevice(id: 1)],
    preselected: Binding(get: { 1 }, set: {_ in}),
    label: Text("Preview"))
  }
}
