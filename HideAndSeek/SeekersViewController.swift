//
//  SeekersViewController.swift
//  
//
//  Created by Jonathan on 2019. 02. 10..
//

import UIKit
import FirebaseDatabase

class SeekersViewController: UIViewController, Storyboarded {

    weak var coordinator: MainCoordinator?
    var reference = GameDataBase.reference
    var playersArray = [Player]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        reference.observe(.childAdded) { (snapshot) in
            
            if let player = Player(snapshot: snapshot) {
                print(player.geoLocation)
            }
        }
        
    }
}
