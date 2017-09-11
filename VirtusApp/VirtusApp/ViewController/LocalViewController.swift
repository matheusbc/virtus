//
//  LocalViewController.swift
//  VirtusApp
//
//  Created by Matheus B Campos on 19/07/17.
//  Copyright © 2017 Matheus B Campos. All rights reserved.
//

import MapKit

class LocalViewController: UIViewController {

    // MARK: Outlets
    @IBOutlet weak var mapView: MKMapView!

    // MARK: Properties
    let regionRadius: CLLocationDistance = 500
    let initialLocation = CLLocation(latitude: -7.216316, longitude: -35.915328)

    override func viewDidLoad() {
        super.viewDidLoad()

        mapView.delegate = self
        centerMapOnLocation(location: initialLocation)
        let virtusPin = MapLocal(title: "Virtus",
                              locationName: "CITTA",
                              coordinate: CLLocationCoordinate2D(latitude: initialLocation.coordinate.latitude, longitude: initialLocation.coordinate.longitude))

        mapView.addAnnotation(virtusPin)
    }

//    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
//        var annotationView = mapView.dequeueReusableAnnotationViewWithIdentifier(reuseId)
//        if annotationView == nil {
//            annotationView = MKAnnotationView(annotation: annotation, reuseIdentifier: reuseId)
//            annotationView.canShowCallout = true
//        }
//        else {
//            annotationView.annotation = annotation
//        }
//        
//        //Set annotation-specific properties **AFTER**
//        //the view is dequeued or created...
//        
//        let cpa = annotation as CustomPointAnnotation
//        annotationView.image = UIImage(named:cpa.imageName)
//        
//        return annotationView
//    }

    // MARK: Private Methods
    private func centerMapOnLocation(location: CLLocation) {
        let coordinateRegion = MKCoordinateRegionMakeWithDistance(location.coordinate,
                                                                  regionRadius * 2.0,
                                                                  regionRadius * 2.0)
        mapView.setRegion(coordinateRegion, animated: true)
    }
}

extension LocalViewController: MKMapViewDelegate {

    func mapView(mapView: MKMapView!, viewForAnnotation annotation: MKAnnotation!) -> MKAnnotationView! {
        if let annotation = annotation as? MapLocal {
            let identifier = "virtusPin"
            var view: MKPinAnnotationView
            if let dequeuedView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier)
                as? MKPinAnnotationView {
                dequeuedView.annotation = annotation
                view = dequeuedView
            } else {
                view = MKPinAnnotationView(annotation: annotation, reuseIdentifier: identifier)
                view.canShowCallout = true
                view.calloutOffset = CGPoint(x: -5, y: 5)
                view.rightCalloutAccessoryView = UIButton.init(type: .detailDisclosure) as UIView
            }
            return view
        }
        return nil
    }
}
