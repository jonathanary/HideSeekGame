//
//  SeekersViewController.swift
//  
//
//  Created by Jonathan on 2019. 02. 10..
//  make an array with their names. the names should indicate the beacons' regions. whenever the seeker taps the  I found? button, the respective name should disappear from the array

import UIKit
import FirebaseDatabase
//import MapKit
import CoreLocation


class SeekersViewController: UITableViewController, Storyboarded {
    

    //var dataSource = SeekersDataSource()
    //var lastTimeStamp = Date()
    
    //Beacon Region
    
    var locationManager: CLLocationManager!
    var isHider = false
    
    var selectedHider: String!
    
    weak var coordinator: MainCoordinator?
    var reference = GameDataBase.reference
    let userReference = GameDataBase.userRefByAutoID
    var hidersArray = [Player]()
    //var activeHidersInRange = 0

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fetchUser()
        
        
        //dataSource.fetchUser()
        //print(dataSource.hiders)
//        self.tableView.reloadData()
        //tableView.dataSource = dataSource
//        DispatchQueue.global(qos: .utility).async {
//
//        }
       // insertNewObject()
       
//        if isHider {
//
//            } else {
//
//            }
        }
    
    
    
    func fetchUser() {
        reference.observe(.childAdded, with: { (snapshot) in
            if let dictionary = snapshot.value as? [String: AnyObject] {
                let player = Player()
                player.name = dictionary["name"] as? String
                self.hidersArray.append(player)
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
        }, withCancel: nil)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return hidersArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        let hider = hidersArray[indexPath.row]
        cell.textLabel?.text = hider.name
        
        return cell
    }
    
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let hider = hidersArray[indexPath.row]
        selectedHider = hider.name
        print(hider.name!)
        coordinator?.goToCatchView(with: selectedHider)
    }
    
//    override func viewWillAppear(_ animated: Bool) {
//        dataSource.fetchUser()
//    }
//    override func viewDidAppear(_ animated: Bool) {
//        dataSource.fetchUser()
//        print(dataSource.hiders)
//    }
    
//    func addAllPlayers() {
//        //dataSource.objects
//    }
    
    //Tracking Beacons methods
    
    
    
//    func givePlayersColors() {
//        for i in 1...activeHidersInRange {
//
//        }
//    }
    
    
    
//    func insertNewObject() {
//        dataSource.objects.insert(NSDate(), at: 0)
//        let indexPath = IndexPath(row: 0, section: 0)
//        tableView.insertRows(at: [indexPath], with: .automatic)
//    }
    
}
