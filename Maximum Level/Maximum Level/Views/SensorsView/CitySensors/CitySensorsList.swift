//
//  CitySensorsList.swift
//  Maximum Level
//
//  Created by Stjepan Mišić on 03.12.2022..
//

import SwiftUI

struct CitySensorsList: View {
    
    #warning("this could be binding in order to react on sensor list changes")
    var citySensors: [SensorData]
    
    var body: some View {
        List{
            ForEach(
                citySensors){ sensor in
                
                NavigationLink {
                    SensorDetail(sensor: sensor)
                } label: {
                    SensorRow(title: sensor.areaName)
                }
            }
        }
        .navigationTitle("Sensors in \(citySensors.first?.city ?? "")")
    }
}

struct CitySensorsList_Previews: PreviewProvider {
    static var previews: some View {
        CitySensorsList(citySensors: ModelData().cities["Split"]!)
    }
}
