//
//  SeekersViewController.swift
//  
//
//  Created by Jonathan on 2019. 02. 10..
//

import UIKit
import FirebaseDatabase
import MapKit

class HidersViewControlller: UIViewController, Storyboarded {

    @IBOutlet weak var mapView: MKMapView!
    
    weak var coordinator: MainCoordinator?
    var reference = GameDataBase.reference
    var playersArray = [Player]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        
        self.navigationItem.setRightBarButton(UIBarButtonItem(barButtonSystemItem: .add, target: self, action: nil), animated: true)
        
        mapView.userTrackingMode = .follow
        reference.observe(.childAdded) { (snapshot) in
            
            if let player = Player(snapshot: snapshot) {
                print(player.geoLocation)
            }
        }
        
    }
}
