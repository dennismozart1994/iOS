//
//  ViewController.swift
//  My trips
//
//  Created by Dennis Silva on 19/11/18.
//  Copyright © 2018 Curso iOS. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {

    @IBOutlet weak var map: MKMapView!
    
    var locationManager = CLLocationManager()
    var trip: Dictionary<String, String> = [:]
    var selectedIndex: Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        if let index = selectedIndex{
            if index == -1{
                // user is adding
                locationManagerConfig()
            }
            else{
                // user is listing
                addPin(trip: trip)
            }
        }
        
        // After gesture recognize calls pin function with parameters (:)
        let RecognizeLongTap = UILongPressGestureRecognizer(target: self, action: #selector(self.pin(gesture:)))
        // Recognize gesture after tap and hold for 2 seconds
        RecognizeLongTap.minimumPressDuration = 2
        
        // Add gesture to the map
        map.addGestureRecognizer(RecognizeLongTap)
        
    }
    
    func addPin(trip: Dictionary<String, String>){
        // Create pin
        if let spotLocal = trip["local"] {
            if let spotLatitudeS = trip["latitude"]{
                if let spotLongitudeS = trip["longitude"]{
                    if let spotLatitude = Double(spotLatitudeS){
                        if let spotLongitude = Double(spotLongitudeS){
                            // show user local
                            showLocation(latitude: spotLatitude, longitude: spotLongitude)
                            
                            // add pin
                            let notation = MKPointAnnotation()
                            notation.coordinate.latitude = spotLatitude
                            notation.coordinate.longitude = spotLongitude
                            notation.title = spotLocal
                            self.map.addAnnotation(notation)
                        }
                    }
                }
            }
        }
        
    }
    
    // Gesture called on GestureRecognizer named RecognizeLongTap
    @objc func pin(gesture: UIGestureRecognizer){
        if gesture.state == UIGestureRecognizer.State.began {
            // do what you want.
            let selectedPoint = gesture.location(in: self.map)
            let coordinates = map.convert(selectedPoint, toCoordinateFrom: self.map)
            
            // Get Adress of the point selected.
            let gpsLocation = CLLocation(latitude: coordinates.latitude, longitude: coordinates.longitude)
            var CompleteLocal = "Endereço não encontrado"
            // Use a closer function to check if the spot has a name, if yes show the name, if no, show the adress on title
            CLGeocoder().reverseGeocodeLocation(gpsLocation) { (spot, error) in
                if error == nil {
                    if let localData = spot?.first {
                        if let name = localData.name{
                            CompleteLocal = name
                        }else{
                            if let adress = localData.thoroughfare{
                                CompleteLocal = adress
                            }
                        }
                    }
                    
                    // save data into the device
                    self.trip = ["local": CompleteLocal, "latitude": String(coordinates.latitude), "longitude": String(coordinates.longitude)]
                    Data().SaveTrip(trip: self.trip)
                    
                    // Create pin
                    self.addPin(trip: self.trip)
                    
                }else{
                    print(error!)
                }
            }
        }
    }
    
    // Config location manager
    func locationManagerConfig(){
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
    }
    
    func showLocation(latitude: Double, longitude: Double){
        // show user local
        let rLocation = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        let zoom = MKCoordinateSpan(latitudeDelta: 0.001, longitudeDelta: 0.001)
        let region: MKCoordinateRegion = MKCoordinateRegion(center: rLocation, span: zoom)
        self.map.setRegion(region, animated: true)
    }
    
    // calls everytime the location is updated
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        // show user local
        let location = locations.last
        // show user local
        showLocation(latitude: location!.coordinate.latitude, longitude: location!.coordinate.longitude)
    }
    
    // Check GPS permissions
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        if status != .authorizedWhenInUse {
            // Create alert in case of not authorized
            let alert = UIAlertController(title: "Sem permissão para localização", message: "O aplicativo requer serviços de localização ativos", preferredStyle: .alert)
            let cancelAlert = UIAlertAction(title: "Não permitir", style: .cancel, handler: nil)
            let configPermissions = UIAlertAction(title: "Abrir configurações", style: .destructive) { (openConfig) in
                // Open config to enable GPS for the app
                if let config = NSURL(string: UIApplication.openSettingsURLString) {
                    UIApplication.shared.open(config as URL)
                }
            }
            
            alert.addAction(configPermissions)
            alert.addAction(cancelAlert)
            
            present(alert, animated: true)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}

