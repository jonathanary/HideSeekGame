//
//  SeekersViewController.swift
//  
//
//  Created by Jonathan on 2019. 02. 10..
//  make an array with their names. the names should indicate the beacons' regions. whenever the seeker taps the  I found? button, the respective name should disappear from the array

import UIKit
import FirebaseDatabase
import CoreLocation


class SeekersViewController: UITableViewController, Storyboarded {
    weak var coordinator: MainCoordinator?
    var locationManager: CLLocationManager!
    var isHider = false
    var selectedHider: String!
    var reference = GameDatabase.gameReference
    let userReference = GameDatabase.userRefByName
    var hidersArray = [Player]()

    override func viewDidLoad() {
        super.viewDidLoad()
        fetchUser()
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
}
