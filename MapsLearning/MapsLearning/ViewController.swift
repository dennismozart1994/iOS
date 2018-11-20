//
//  ViewController.swift
//  MapsLearning
//
//  Created by Dennis Silva on 18/11/18.
//  Copyright © 2018 Curso iOS. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {

    @IBOutlet weak var map: MKMapView!
    var locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        
//        // Desired location
//        let latitude : CLLocationDegrees = -23.566809
//        let longitude : CLLocationDegrees = -46.943462
//
//        // Zoom Threshold
//        let deltaLatitude : CLLocationDegrees = 0.003
//        let deltaLongitude : CLLocationDegrees = 0.003
//
//        // Create location
//        let location : CLLocationCoordinate2D = CLLocationCoordinate2DMake(latitude, longitude)
//
//        // Create Zoom threshold
//        let visualArea : MKCoordinateSpan = MKCoordinateSpan(latitudeDelta: deltaLatitude, longitudeDelta: deltaLongitude)
//
//        // Create map region based on parameters created before
//        let region : MKCoordinateRegion = MKCoordinateRegion(center: location, span: visualArea)
//
//        // Set map region based on the location and zoom configured
//        map.setRegion(region, animated: true)
//
//        // Create and config Pin
//        let pin = MKPointAnnotation()
//        pin.coordinate = location
//        pin.title = "Casa"
//        pin.subtitle = "Rua Marajó, 15 - Parque Suburbano"
//        // Add pin on the map
//        map.addAnnotation(pin)
//
    }
    
    // update user location

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let userLocation : CLLocation = locations.last!
       
        // Desired location
        let latitude : CLLocationDegrees = userLocation.coordinate.latitude
        let longitude : CLLocationDegrees = userLocation.coordinate.longitude
       
        // Zoom Threshold
        let deltaLatitude : CLLocationDegrees = 0.003
        let deltaLongitude : CLLocationDegrees = 0.003

        // Create location
        let location : CLLocationCoordinate2D = CLLocationCoordinate2DMake(latitude, longitude)

        // Create Zoom threshold
        let visualArea : MKCoordinateSpan = MKCoordinateSpan(latitudeDelta: deltaLatitude, longitudeDelta: deltaLongitude)

        // Create map region based on parameters created before
        let region : MKCoordinateRegion = MKCoordinateRegion(center: location, span: visualArea)

        // Set map region based on the location and zoom configured
        map.setRegion(region, animated: true)
        
    }

}

