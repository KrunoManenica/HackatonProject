//
//  SensorRow.swift
//  Maximum Level
//
//  Created by Stjepan Mišić on 03.12.2022..
//

import SwiftUI

struct SensorRow: View {
    var title: String
    var totalAmountOfSensors: Int?
    
    var body: some View {
        HStack {
            Text(title)
            if let totalAmount = totalAmountOfSensors {
                Spacer()
                Text("(\(totalAmount))")
            }
            
        }
        .padding()
    }
}

struct SensorRow_Previews: PreviewProvider {
    static var previews: some View {
        SensorRow(title: "Split", totalAmountOfSensors: 3)
    }
}
