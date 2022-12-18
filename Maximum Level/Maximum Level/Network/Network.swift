//
//  Network.swift
//  Maximum Level
//
//  Created by Stjepan Mišić on 03.12.2022..
//

import Foundation
import Combine

class Network: ObservableObject {
    @Published var sensor: SensorData?
    
    func getSensorsData() -> AnyPublisher<SensorData, Error> {
        #warning("This is only URL for one hardcoded sensor")
        guard let url = URL(string: "http://b544-161-53-39-201.ngrok.io/2222") else { fatalError("Missing URL") }
        
        return URLSession.shared.dataTaskPublisher(for: url).map { $0.data }
            .decode(type: SensorData.self, decoder: JSONDecoder())
            .receive(on: RunLoop.main)
            .eraseToAnyPublisher()
    }
}
