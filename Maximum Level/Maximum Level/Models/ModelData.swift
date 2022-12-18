//
//  SensorData.swift
//  Maximum Level
//
//  Created by Stjepan Mišić on 03.12.2022..
//

import Foundation
import Combine

final class ModelData: ObservableObject {
    @Published var sensors: [SensorData] = load("sensorData.json")
    
    private var network = Network()
    private var cancellable: AnyCancellable?
    
    func fetchData() {
        cancellable = network.getSensorsData().sink(receiveCompletion: { error in
            print(error)
        }, receiveValue: { sensorData in
            let index = self.sensors.firstIndex(where: { $0.city.contains(sensorData.city ) })
            if let indexUnwwrapped = index {
                self.sensors[indexUnwwrapped] = sensorData
            }
        })
    }
    
    var cities: [String: [SensorData]] {
        Dictionary(
            grouping: sensors,
            by: { $0.city }
        )
    }
    
    func numberOfSensorsFor(city: String) -> Int {
        let citySensors = sensors.filter({ $0.city.lowercased() == city.lowercased() })
        return citySensors.count
    }
}

func load<T: Decodable>(_ filename: String) -> T {

    let data: Data


    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)

    else {

        fatalError("Couldn't find \(filename) in main bundle.")

    }


    do {

        data = try Data(contentsOf: file)

    } catch {

        fatalError("Couldn't load \(filename) from main bundle:\n\(error)")

    }


    do {

        let decoder = JSONDecoder()

        return try decoder.decode(T.self, from: data)

    } catch {

        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")

    }

}
