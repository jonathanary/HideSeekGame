//
//  CatchHiderViewController.swift
//  HideAndSeek
//
//  Created by Jonathan on 2019. 02. 26..
//  Copyright © 2019. Jonathan. All rights reserved.
//

import UIKit
import CoreLocation

class CatchHiderViewController: UIViewController, Storyboarded, CLLocationManagerDelegate {

    
    var coordinator: MainCoordinator?
    let backgroundColor = BackgoundColorProvider()
    var hider = ""
    
    
    var locationManager: CLLocationManager!
    
    @IBOutlet var hidersColorOutlet: UIImageView!
    @IBOutlet var messageLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationManager = CLLocationManager.init()
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        startScanningForBeaconRegion(beaconRegion: getBeaconRegion())
        
        hidersColorOutlet.backgroundColor = backgroundColor.randomColor()
        hidersColorOutlet.alpha = 0
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewDidDisappear(true)
        self.hider = ""
    }
    
    func getMajorFromUsername() -> UInt16 {
        var n = 8549
        for i in hider {
            let numberFromUsername = i.asciiValue
            
            n -= numberFromUsername
            if n < 0 {
                n += numberFromUsername
            }
        }
        return UInt16(n)
    }
    
    func getBeaconRegion() -> CLBeaconRegion {
        let beaconRegion = CLBeaconRegion.init(proximityUUID: UUID.init(uuidString: "3187820A-0780-49E7-8F89-855B433BE32F")!, major: getMajorFromUsername(), identifier: self.hider)
//         = CLBeaconRegion.init(proximityUUID: UUID.init(uuidString: "3187820A-0780-49E7-8F89-855B433BE32F")!,
//                                               identifier: self.hider)
        print(self.hider)
        return beaconRegion
    }
    
    func startScanningForBeaconRegion(beaconRegion: CLBeaconRegion) {
        print(beaconRegion)
        locationManager.startMonitoring(for: beaconRegion)
        locationManager.startRangingBeacons(in: beaconRegion)
    }
    
    // Delegate Methods for tracking beacons
    
    func locationManager(_ manager: CLLocationManager, didRangeBeacons beacons: [CLBeacon], in region: CLBeaconRegion) {
        if beacons.count > 0 {
            //activeHidersInRange = beacons.count
            print("beacons found")
            for beacon in beacons {
                //print(beacon?.proximityUUID.uuidString)
                //print(beacon?.major.stringValue)
                // print(beacon.proximityUUID.uuidString)
                print(String(describing: beacon.accuracy))
                
//                if beacon.accuracy < 100 {
//                    //(100-accuracy)/100 - 0.25
//                    self.hidersColorOutlet.alpha = CGFloat((100.0-beacon.accuracy) / 100.0 - 0.25)
//                }
                //print(String(describing: beacon?.rssi))
                
                //region.is
                
                if beacon.proximity == CLProximity.unknown {
                    print("Unknown Proximity")
                    self.hidersColorOutlet.alpha = 0
                    self.messageLabel.textColor = .darkGray
                    self.messageLabel.text = "\(hider) is far, or closed the app"
                } else if beacon.proximity == CLProximity.immediate {
                    print("Immediate Proximity")
                    self.hidersColorOutlet.alpha = 1
                    self.messageLabel.textColor = .white
                    self.messageLabel.text = "\(hider) is here!"
                } else if beacon.proximity == CLProximity.near {
                    print("Near Proximity")
                    self.hidersColorOutlet.alpha = 0.6
                    self.messageLabel.textColor = .white
                    self.messageLabel.text = "\(hider) is close!"
                } else if beacon.proximity == CLProximity.far {
                    print("Far Proximity")
                    self.hidersColorOutlet.alpha = 0.3
                    self.messageLabel.textColor = .gray
                    self.messageLabel.text = "\(hider) is not so far"
                }
            }
            
        } else {
            print("no hiders in range")
        }
        print("Ranging")
    }
}
