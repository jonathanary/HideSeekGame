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
    weak var coordinator: MainCoordinator?
    let backgroundColor = BackgoundColorProvider()
    var hider = ""
    var locationManager: CLLocationManager!
    
    @IBOutlet var hidersColorOutlet: UIImageView!
    @IBOutlet var messageLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    func setup() {
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
    
    func getBeaconRegion() -> CLBeaconRegion {
        let beaconRegion = CLBeaconRegion.init(proximityUUID: UUID.init(uuidString: "3187820A-0780-49E7-8F89-855B433BE32F")!, major: CodeTrimmers.setMajor(with: hider), identifier: self.hider)
        return beaconRegion
    }
    
    func startScanningForBeaconRegion(beaconRegion: CLBeaconRegion) {
        locationManager.startMonitoring(for: beaconRegion)
        locationManager.startRangingBeacons(in: beaconRegion)
    }
    
    // Delegate Methods for tracking beacons and changing the view
    fileprivate func changeViewByProximity(_ beacon: CLBeacon) {
        
        switch beacon.proximity {
        case .unknown:
            self.hidersColorOutlet.alpha = 0
            self.messageLabel.textColor = .darkGray
            self.messageLabel.text = "\(hider) is too far, or closed the app"
        case .immediate:
            self.hidersColorOutlet.alpha = 1
            self.messageLabel.textColor = .white
            self.messageLabel.text = "\(hider) is here!"
        case .near:
            self.hidersColorOutlet.alpha = 0.6
            self.messageLabel.textColor = .white
            self.messageLabel.text = "\(hider) is very close!"
        case .far:
            self.hidersColorOutlet.alpha = 0.3
            self.messageLabel.textColor = .gray
            self.messageLabel.text = "\(hider) is in range!"
        @unknown default:
            fatalError()
        }
    }
}

extension CatchHiderViewController {
    func locationManager(_ manager: CLLocationManager, didRangeBeacons beacons: [CLBeacon], in region: CLBeaconRegion) {
        if beacons.count > 0 {
            print("beacons found")
            for beacon in beacons {
                print(String(describing: beacon.accuracy))
                changeViewByProximity(beacon)
            }
            
        } else {
            print("no hiders in range")
        }
        print("Ranging")
    }
}
