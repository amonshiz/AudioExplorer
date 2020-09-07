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

    ForEach(devices.indices) { index in
      VStack {
        Text("\(devices[index].id)")
        Text("\(devices[index].name)")
        if let image = devices[index].image {
          Image(nsImage: image)
        }
        if devices[index].input {
          Text("Has Input")
        }
        if devices[index].output {
          Text("Has Output")
        }
      }
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
