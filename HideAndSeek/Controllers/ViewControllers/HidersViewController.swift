//
//  HIdersViewController.swift
//  HideAndSeek
//
//  Created by Jonathan on 2019. 02. 10..
//  Copyright © 2019. Jonathan. All rights reserved.
//

import UIKit
import CoreBluetooth
import CoreLocation
import FirebaseDatabase

class HidersViewController: UIViewController, Storyboarded, CBPeripheralManagerDelegate {
    weak var coordinator: MainCoordinator?
    var reference = GameDatabase.gameReference
    let username = GameDatabase.userName
    var beaconRegion: CLBeaconRegion!
    var beaconPeripheralData : NSDictionary!
    var peripheralManager : CBPeripheralManager!
    var locationManager: CLLocationManager!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initBeaconRegion()
        beaconPeripheralData = beaconRegion.peripheralData(withMeasuredPower: nil)
        peripheralManager = CBPeripheralManager.init(delegate: self, queue: nil)
    }
    
    func initBeaconRegion() {
        beaconRegion = CLBeaconRegion.init(proximityUUID: UUID.init(uuidString: "3187820A-0780-49E7-8F89-855B433BE32F")!,
                                           major: CodeTrimmers.setMajor(with: username!),
                                           minor: 1,
                                           identifier: username!)
    }
    
    // Delegate Methods for the beacons
    func peripheralManagerDidUpdateState(_ peripheral: CBPeripheralManager) {
        if (peripheral.state == .poweredOn) {
            peripheralManager .startAdvertising(beaconPeripheralData as? [String : Any])
            print("Beacons are Powered On")
            
        } else {
            peripheralManager .stopAdvertising()
            print("Beacons are Not Powered On, or some other error")
        }
    }
}
