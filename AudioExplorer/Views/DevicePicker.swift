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

  @State var selectedDevice: AudioDevice

  init(availableDevices: [AudioDevice], preselected: AudioDevice? = nil, label: Label, debugging: Bool = false) {
    assert(availableDevices.count > 0)
    self.debugging = debugging
    self.label = label
    self.availableDevices = availableDevices
    self._selectedDevice = .init(wrappedValue: preselected ?? availableDevices.first!)
  }

  var body: some View {
    VStack {
      Picker(selection: $selectedDevice, label: label) {
        ForEach(availableDevices) { d in
          Text(d.name ?? "NO NAME").tag(d)
        }
      }
      .pickerStyle(MenuPickerStyle())
      if debugging {
        Text("Selected by device: \(selectedDevice.name ?? "")")
      }
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
