//
//  LocalViewController.swift
//  VirtusApp
//
//  Copyright © 2017 Matheus B Campos. All rights reserved.
//

import MapKit

/// The local map view controller.
class LocalViewController: UIViewController, Loadable {
    // MARK: Outlets
    /// The map view instance.
    @IBOutlet weak var mapView: MKMapView!

    // MARK: Properties
    /// The local map view model.
    let localViewModel = LocalViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()

        let loading = self.showLoading(self)
        self.setupMap()
        self.dismissLoading(loading)
    }

    // MARK: Private Methods
    /**
     Setup the map.

     Sets the initial position, the delegate and the pin.
    */
    private func setupMap() {
        mapView.delegate = self
        centerMapOnLocation(location: localViewModel.initialLocation)

        mapView.addAnnotation(localViewModel.virtusPin)
    }

    /**
     Center the map to the location point.

     - Parameter location: The center location point.
    */
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
