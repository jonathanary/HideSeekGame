//
//  SeekersViewController.swift
//  
//
//  Created by Jonathan on 2019. 02. 10..
//

import UIKit
import FirebaseDatabase
import MapKit

class SeekersViewControlller: UIViewController, Storyboarded {

    @IBOutlet weak var mapView: MKMapView!
    
    let locationManager = CLLocationManager()
    
    weak var coordinator: MainCoordinator?
    var reference = GameDataBase.reference
    var playersArray = [Player]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
       //mapView.delegate = self
        checkLocationServices()
        if let location = locationManager.location?.coordinate {
            print(location)
        }
        
        //self.navigationItem.setRightBarButton(UIBarButtonItem(barButtonSystemItem: .add, target: self, action: nil), animated: true)
        
        mapView.userTrackingMode = .follow
        reference.observe(.childAdded) { (snapshot) in
            
            if let player = Player(snapshot: snapshot) {
                print(player.geoLocation)
            }
        }
        
    }
    
    func setupLocationManager() {
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBestForNavigation
        locationManager.distanceFilter = 0.4 //In meters
        locationManager.requestAlwaysAuthorization()
        locationManager.allowsBackgroundLocationUpdates = true
        locationManager.pausesLocationUpdatesAutomatically = false //??
    }
    
    func checkLocationServices() {
        if CLLocationManager.locationServicesEnabled() {
            setupLocationManager()
            checkLocationAuthorization()
        } else {
            // alert user they don't use location
        }
    }
    
    func checkLocationAuthorization() {
        switch CLLocationManager.authorizationStatus() {
        case .authorizedWhenInUse:
            // Maybe here as well
            break
        case .denied:
            //Show alert instructing them how to turn on permissions
            break
        case .notDetermined:
            locationManager.requestAlwaysAuthorization()
            //Show an alert letting the user know about the restriction
            break
        case .restricted:
            break
        case .authorizedAlways:
            // This is what I need
            break
        }
    }
}

extension SeekersViewControlller: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        //
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        //
    }
}
