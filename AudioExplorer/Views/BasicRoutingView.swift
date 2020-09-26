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

  var body: some View {
    HStack(spacing: 10.0) {
      DevicePicker(availableDevices: inputDevices, label: Text("Input devices"))
      Spacer()
      DevicePicker(availableDevices: outputDevices, label: Text("Output devices"))
    }
    .padding()
  }
}

struct BasicRoutingView_Previews: PreviewProvider {
  static var previews: some View {
    BasicRoutingView(allDevices: [])
  }
}
