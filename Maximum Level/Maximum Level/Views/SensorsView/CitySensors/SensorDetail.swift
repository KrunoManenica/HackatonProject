//
//  SensorDetail.swift
//  Maximum Level
//
//  Created by Stjepan Mišić on 03.12.2022..
//

import SwiftUI
import CoreLocation

struct SensorDetail: View {
    
    var sensor: SensorData
    
    var body: some View {
        
        ScrollView {
            MapView(coordinate: CLLocationCoordinate2D(latitude: sensor.coordinates?.latitude ?? 43.5143802, longitude: sensor.coordinates?.longitude ?? 16.4228088))
                .ignoresSafeArea(edges: .top)
                .frame(height: 300)
            
            VStack(alignment: .leading) {
                
                Text("Sensor ID: \(sensor.id)")
                    .font(.title)
                Spacer()
                getWaterDetectionTextView()
                
            }
            .padding()
        }
        .navigationTitle(sensor.city)
        .navigationBarTitleDisplayMode(.inline)
    }
    
    private func getWaterDetectionTextView() -> Text {
        var textView: Text
        
        if sensor.waterDetected {
            textView = Text("Alert! Water is detected")
                .fontWeight(.bold)
                .font(.title)
                .foregroundColor(.red)
        } else {
            textView = Text("Water is not detected")
                .fontWeight(.bold)
                .font(.title)
        }
        return textView
    }
    
}

struct SensorDetail_Previews: PreviewProvider {
    static var previews: some View {
        SensorDetail(sensor: ModelData().sensors.first!)
    }
}
