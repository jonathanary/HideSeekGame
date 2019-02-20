//
//  Location.swift
//  HideAndSeek
//
//  Created by Jonathan on 2019. 02. 17..
//  Copyright © 2019. Jonathan. All rights reserved.
//

import Foundation
import CoreLocation

//class MyLocation: NSObject, CLLocationManagerDelegate {
//    
//    let locationManager = CLLocationManager()
//    
//    
//  
//    func locationManager(_ manager: CLLocationManager,  didUpdateLocations locations: [CLLocation]) {
//        let lastLocation = locations.last!
//        
//        // Do something with the location.
//        //userRefByAutoID.setValue(["geoLocation": lastLocation])
//    }
//    
//    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
//        ////
//    }
//    
//    func startReceivingLocationChanges() {
//        let authorizationStatus = CLLocationManager.authorizationStatus()
//        if authorizationStatus != .authorizedWhenInUse && authorizationStatus != .authorizedAlways {
//            // User has not authorized access to location information.
//            return
//        }
//        
//        // Do not start services that aren't available.
//        if !CLLocationManager.locationServicesEnabled() {
//            // Location services is not available.
//            return
//        }
//        // Configure and start the service.
//        locationManager.desiredAccuracy = kCLLocationAccuracyBestForNavigation
//        locationManager.distanceFilter = 0.4 //In meters
//        locationManager.requestAlwaysAuthorization()
//        locationManager.allowsBackgroundLocationUpdates = true
//        locationManager.pausesLocationUpdatesAutomatically = false //??
//        
//    }
//    
//}








//    static let dateFormatter: DateFormatter = {
//        let formatter = DateFormatter()
//        formatter.dateStyle = .medium
//        formatter.timeStyle = .medium
//        return formatter
//    }()
//
//    var coordinates: CLLocationCoordinate2D {
//        return CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
//    }
//
//    let latitude: Double
//    let longitude: Double
//    let date: Date
//    let dateString: String
//    let description: String
//
//    init(_ location: CLLocationCoordinate2D, date: Date, descriptionString: String) {
//        latitude =  location.latitude
//        longitude =  location.longitude
//        self.date = date
//        dateString = Location.dateFormatter.string(from: date)
//        description = descriptionString
//    }
//
//    convenience init(visit: CLVisit, descriptionString: String) {
//        self.init(visit.coordinate, date: visit.arrivalDate, descriptionString: descriptionString)
//    }
//}
