//
//  MapLocal.swift
//  VirtusApp
//
//  Created by Matheus B Campos on 20/07/17.
//  Copyright © 2017 Matheus B Campos. All rights reserved.
//

import MapKit

class MapLocal: NSObject, MKAnnotation {
    let title: String?
    let locationName: String
    let coordinate: CLLocationCoordinate2D

    init(title: String, locationName: String, coordinate: CLLocationCoordinate2D) {
        self.title = title
        self.locationName = locationName
        self.coordinate = coordinate

        super.init()
    }

    var subtitle: String? {
        return locationName
    }
}
