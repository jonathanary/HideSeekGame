//
//  SeekersViewController.swift
//  
//
//  Created by Jonathan on 2019. 02. 10..
//

import UIKit
import FirebaseDatabase

class SeekersViewController: UIViewController, Storyboarded {

    let date = GameDate.shared()
    weak var coordinator: MainCoordinator?
    var reference = Database.database().reference()
    var data = [NSObject]()
    var playersArray = [Player]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        reference = reference.child(date)
        reference.observe(.childAdded) { (snapshot) in
            
            if let player = Player(snapshot: snapshot) {
                print(player.geoLocation)
            }
        }
        
    }
}
