//
//  LocalViewModel.swift
//  VirtusApp
//
//  Copyright © 2017 Matheus B Campos. All rights reserved.
//

import MapKit

/// The map local pin ViewModel.
class LocalViewModel {
    // MARK: Properties
    /**
     Region radius to be showed in the map.
    */
    let regionRadius: CLLocationDistance = 500
    /**
     Virtus location.

     It will be used for the map pin position and the initial center location.
    */
    let initialLocation = CLLocation(latitude: -7.216316, longitude: -35.915328)
    /**
     The map pin used in the Virtus location.
    */
    let virtusPin: MapLocal

    init() {
        virtusPin = MapLocal(title: "Virtus",
                             locationName: "CITTA",
                             coordinate: CLLocationCoordinate2D(latitude: self.initialLocation.coordinate.latitude,
                                                                longitude: self.initialLocation.coordinate.longitude))
    }
}
