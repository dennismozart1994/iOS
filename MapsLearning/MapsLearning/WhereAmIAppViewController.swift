//
//  WhereAmIAppViewController.swift
//  MapsLearning
//
//  Created by Dennis Silva on 19/11/18.
//  Copyright © 2018 Curso iOS. All rights reserved.
//

import UIKit
import MapKit

class WhereAmIAppViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate{
    
    // screen references
    @IBOutlet weak var map: MKMapView!
    @IBOutlet weak var userVelocity: UILabel!
    @IBOutlet weak var userLatitude: UILabel!
    @IBOutlet weak var userLongitude: UILabel!
    @IBOutlet weak var userAdress: UILabel!
    
    
    var locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // setup map
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        
        // Do any additional setup after loading the view.
    }
    
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let userLocation = locations.last
        let longitude = userLocation!.coordinate.longitude
        let latitude = userLocation!.coordinate.latitude
        
        // update data on Screen
        userLongitude.text = String(describing: longitude)
        userLatitude.text = String(describing: latitude)
        
        if userLocation!.speed > 0 {
            userVelocity.text = String(describing: userLocation!.speed)
        }
        
        // exibith Area (Zoom Map)
        let deltaLat: CLLocationDegrees = 0.001
        let deltaLong: CLLocationDegrees = 0.001
        let AreaSpan = MKCoordinateSpan(latitudeDelta: deltaLat, longitudeDelta: deltaLong)
       
        let location: CLLocationCoordinate2D = CLLocationCoordinate2DMake(latitude, longitude)
        // create Region
        let region = MKCoordinateRegion(center: location, span: AreaSpan)
        
        // Set focus region on Map
        map.setRegion(region, animated: true)
        
        // Get device accurate location
        CLGeocoder().reverseGeocodeLocation(userLocation!) { (localDetails, error) in
            if error == nil {
                if let spot = localDetails?.first{
                    print(spot)
                    
                    // Street Name
                    var StreetName = ""
                    if spot.thoroughfare != nil {
                        StreetName = spot.thoroughfare!
                    }
                    
                    // Street Number
                    var AdressNumber = ""
                    if spot.subThoroughfare != nil {
                        AdressNumber = spot.subThoroughfare!
                    }
                    
                    // City
                    var CityName = ""
                    if spot.locality != nil {
                        CityName = spot.locality!
                    }
                    
                    // Neibourhood
                    var Neibourhood = ""
                    if spot.subLocality != nil {
                        Neibourhood = spot.subLocality!
                    }
                    
                    // Postal Code
                    var postalCode = ""
                    if spot.postalCode != nil {
                        postalCode = spot.postalCode!
                    }
                    
                    // Country Name
                    var countryName = ""
                    if spot.country != nil {
                        countryName = spot.country!
                    }
                    
                    // State Name
                    var StateName = ""
                    if spot.administrativeArea != nil {
                        StateName = spot.administrativeArea!
                    }
                    
                    var subAdministrativeArea = ""
                    if spot.subAdministrativeArea != nil {
                        subAdministrativeArea = spot.subAdministrativeArea!
                    }
                    
                    self.userAdress.text = StreetName + ", " + AdressNumber + "- " + Neibourhood +  ", " + CityName + " - " + StateName + "/" + countryName
                }
            }else{
                print(error!)
            }
        }
    }
    
    
    // Check authorization for the app
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        // if user does not auth location use
        if status != .authorizedWhenInUse{
            print("Not Authorized")
            // create alert
            let alertCont = UIAlertController(title: "Problemas com a localização", message: "O app necessita do acesso a sua localização para funcionar corretamente", preferredStyle: .alert)
            
            // create cancel button
            let cancelAlertButton = UIAlertAction(title: "Cancelar", style: .default, handler: nil)
            
            // create open config and set functionality on handler
            let configAlertButton = UIAlertAction(title: "Abrir configurações", style: .destructive) { (configs) in
                // if variable is set, then open the settings config url
                if let configScreen = NSURL(string: UIApplication.openSettingsURLString){
                    UIApplication.shared.open(configScreen as URL)
                }
            }
            
            // add buttons on alert
            alertCont.addAction(configAlertButton)
            alertCont.addAction(cancelAlertButton)
            
            // show alert
            present(alertCont, animated: true, completion: nil)
            
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
