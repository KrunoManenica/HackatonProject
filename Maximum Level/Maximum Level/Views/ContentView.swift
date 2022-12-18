//
//  ContentView.swift
//  Maximum Level
//
//  Created by Stjepan Mišić on 03.12.2022..
//

import SwiftUI

struct ContentView: View {
    
    @State private var selection: Tab = .sensors
    
    enum Tab {
        case sensors
    }
    
    var body: some View {
        TabView(selection: $selection) {
            StateSensorsList()
                .tabItem({
                    Label("Sensors", systemImage: "sensor.tag.radiowaves.forward")
                })
                .tag(Tab.sensors)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(ModelData())
    }
}
