//
//  BasicRoutingView.swift
//  AudioExplorer
//
//  Created by Andrew Monshizadeh on 9/26/20.
//

import SwiftUI

struct BasicRoutingView: View {
  let allDevices: [AudioDevice]

  private var outputDevices: [AudioDevice] { allDevices.filter(\.output) }
  private var inputDevices: [AudioDevice] { allDevices.filter(\.input) }

  @State var currentInput: AudioDevice?
  @State var currentOutput: AudioDevice?

  init(allDevices: [AudioDevice], currentInput: AudioDevice?, currentOutput: AudioDevice?) {
    self.allDevices = allDevices
    _currentInput = State(initialValue: currentInput)
    _currentOutput = State(initialValue: currentOutput)
  }

  var body: some View {
    HStack(spacing: 10.0) {
      DevicePicker(availableDevices: inputDevices, preselected: currentInput, label: Text("Input devices"))
      Spacer()
      DevicePicker(availableDevices: outputDevices, preselected: currentOutput, label: Text("Output devices"))
    }
    .padding()
  }
}

struct BasicRoutingView_Previews: PreviewProvider {
  static var previews: some View {
    BasicRoutingView(allDevices: [], currentInput: AudioDevice(id: 1), currentOutput: AudioDevice(id: 2))
  }
}
