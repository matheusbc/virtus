//
//  MapLocal.swift
//  VirtusApp
//
//  Copyright © 2017 Matheus B Campos. All rights reserved.
//

import MapKit

/// The map pin location model.
class MapLocal: NSObject, MKAnnotation {
    // MARK: Properties
    /// The map pin title.
    let title: String?
    /// The map pin location name.
    let locationName: String
    /// The map pin location coordinate.
    let coordinate: CLLocationCoordinate2D

    /**
     Class initializer.

     - Parameter title: The map pin title.
     - Parameter locationName: The map pin subtitle.
     - Parameter coordinate: The map pin location coordinate (CLLocationCoordinate2D).
    */
    init(title: String, locationName: String, coordinate: CLLocationCoordinate2D) {
        self.title = title
        self.locationName = locationName
        self.coordinate = coordinate

        super.init()
    }

    /**
     The map pin subtitle.

     - Returns: A String with the subtitle (location name).
    */
    var subtitle: String? {
        return locationName
    }
}
