//
//  LocalViewModel.swift
//  VirtusApp
//
//  Created by Matheus Campos on 11/09/17.
//  Copyright © 2017 Matheus B Campos. All rights reserved.
//

import MapKit

class LocalViewModel {
    // MARK: Properties
    let regionRadius: CLLocationDistance = 500
    let initialLocation = CLLocation(latitude: -7.216316, longitude: -35.915328)
    let virtusPin: MapLocal

    init() {
        virtusPin = MapLocal(title: "Virtus",
                             locationName: "CITTA",
                             coordinate: CLLocationCoordinate2D(latitude: self.initialLocation.coordinate.latitude,
                                                                longitude: self.initialLocation.coordinate.longitude))
    }
}
