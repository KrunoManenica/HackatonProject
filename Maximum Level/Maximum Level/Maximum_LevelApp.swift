//
//  Maximum_LevelApp.swift
//  Maximum Level
//
//  Created by Stjepan Mišić on 03.12.2022..
//

import SwiftUI

@main
struct Maximum_LevelApp: App {
    
    @StateObject private var modelData = ModelData()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(modelData)
        }
    }
}
