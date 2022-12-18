//
//  SensorDataView.swift
//  Maximum Level
//
//  Created by Stjepan Mišić on 03.12.2022..
//

import SwiftUI

struct StateSensorsList: View {
    
    @EnvironmentObject var modelData: ModelData
    
    let timer = Timer.publish(every: 10, on: .main, in: .common).autoconnect()
    
    var body: some View {
        
        NavigationStack {
            List{
                
                ForEach(modelData.sensors){ sensor in
                    
                    NavigationLink {
                        CitySensorsList(citySensors: modelData.cities[sensor.city]!)
                    } label: {
                        SensorRow(title: sensor.city, totalAmountOfSensors: modelData.numberOfSensorsFor(city: sensor.city))
                    }
                    
                }
            }
            .navigationTitle("Cities")
        }
        .onReceive(timer) { time in
            modelData.fetchData()
            print("FETCH DATA CALL")
        }
    }
}

struct StateSensorsList_Previews: PreviewProvider {
    static var previews: some View {
        StateSensorsList()
            .environmentObject(ModelData())
    }
}
