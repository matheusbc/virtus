//
//  LocalViewController.swift
//  VirtusApp
//
//  Copyright © 2017 Matheus B Campos. All rights reserved.
//

import MapKit

class LocalViewController: UIViewController {

    // MARK: Outlets
    @IBOutlet weak var mapView: MKMapView!

    // MARK: Properties
    let localViewModel = LocalViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()

        mapView.delegate = self
        centerMapOnLocation(location: localViewModel.initialLocation)

        mapView.addAnnotation(localViewModel.virtusPin)
    }

    // MARK: Private Methods
    private func centerMapOnLocation(location: CLLocation) {
        let coordinateRegion = MKCoordinateRegionMakeWithDistance(location.coordinate,
                                                                  localViewModel.regionRadius * 2.0,
                                                                  localViewModel.regionRadius * 2.0)
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
