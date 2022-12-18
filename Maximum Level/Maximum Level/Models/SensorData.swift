//
//  SensorData.swift
//  Maximum Level
//
//  Created by Stjepan Mišić on 03.12.2022..
//

import Foundation

struct SensorData: Hashable, Codable, Identifiable {

    var id: String
    var waterDetected: Bool
    var city: String
    var areaName: String
    var coordinates: Coordinates?

    
    struct Coordinates: Hashable, Codable {

        var latitude: Double?
        var longitude: Double?

    }
}
