//
//  MapView.swift
//  Maximum Level
//
//  Created by Stjepan Mišić on 03.12.2022..
//

import SwiftUI

import SwiftUI
import MapKit

struct MapView: View {
    
    var coordinate: CLLocationCoordinate2D
    
    struct MapAnnotationItem: Identifiable {
        var coordinate: CLLocationCoordinate2D
        let id = UUID()
    }
    
    @State private var region: MKCoordinateRegion
    
    init(coordinate: CLLocationCoordinate2D) {
        self.coordinate = coordinate
        self.region = MapView.getRegion(coordinate)
    }
    
    var body: some View {
        
        Map(coordinateRegion: $region, annotationItems: [MapAnnotationItem(coordinate: coordinate)], annotationContent: { location in
            MapMarker(coordinate: location.coordinate, tint: .red)
        })
    }
    
    private static func getRegion(_ coordinate: CLLocationCoordinate2D) -> MKCoordinateRegion {

            return MKCoordinateRegion(

                center: coordinate,

                span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)

            )
        }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView(coordinate: CLLocationCoordinate2D(latitude: 34.011_286, longitude: -116.166_868))
    }
}
