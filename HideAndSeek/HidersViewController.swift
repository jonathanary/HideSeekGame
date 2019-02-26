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
    var reference = GameDataBase.reference
    var players = GameDataBase.hiders
    let username = GameDataBase.userName
    
    
    var beaconRegion: CLBeaconRegion!
    var beaconPeripheralData : NSDictionary!
    var peripheralManager : CBPeripheralManager!
    var locationManager: CLLocationManager!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(username!)
        //print(players)
        
            //fetchUsers()
        initBeaconRegion()
        //locationManager.requestAlwaysAuthorization()
        beaconPeripheralData = beaconRegion.peripheralData(withMeasuredPower: nil)
        peripheralManager = CBPeripheralManager.init(delegate: self, queue: nil)
        
        
//        for (index, player) in players.enumerated() {
//            //print(player.name)
//            print(players)
//            if player == username {
//                initBeaconRegion()
//                print(index)
//            }
//        }
        
        
        
        
//        reference.observe(.childAdded) { (snapshot) in
//            self.players = [Player]()
//            if let dictionary = snapshot.value as? [String: AnyObject] {
//                let player = Player()
//                //player.setValuesForKeys(dictionary)
//                player.name = dictionary["name"] as? String
//                self.players.append(player)
//            }
//        }
        
        
//        for player in players {
//            if player.name == username {
//                
//            }
//        }
        
        
        
        //initBeaconRegion(withMinor: 1)
        
        
    }
    
//    func fetchUsers() {
//        var players = [Player]()
//        reference.observe(.childAdded, with: { (snapshot) in
//
//            if let dictionary = snapshot.value as? [String: AnyObject] {
//                var player = Player()
//                player.name = dictionary["name"] as? String
//                players.append(player)
//                print(players)
//            }
//        }, withCancel: nil)
//
//
//    }
    
   
//    override func viewWillDisappear(_ animated: Bool) {
//        super.viewDidDisappear(true)
//        coordinator?.goToLoginAndChoseView()
//
//    }
    func getMajorFromUsername() -> UInt16 {
        var n = 8549
        for i in username! {
            let numberFromUsername = i.asciiValue
            
            n -= numberFromUsername
            if n < 0 {
                n += numberFromUsername
            }
        }
        return UInt16(n)
    }
    
    
    func initBeaconRegion() {
        beaconRegion = CLBeaconRegion.init(proximityUUID: UUID.init(uuidString: "3187820A-0780-49E7-8F89-855B433BE32F")!,
                                           major: self.getMajorFromUsername(),
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
