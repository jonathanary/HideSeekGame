//
//  TypeCodeViewController.swift
//  HideAndSeek
//
//  Created by Jonathan on 2019. 02. 06..
//  Copyright © 2019. Jonathan. All rights reserved.
//

import UIKit
import FirebaseDatabase
import FirebaseAuth

class TypeCodeViewController: UIViewController, Storyboarded {
    
    var reference = GameDataBase.reference
    var userReference = GameDataBase.userRefByAutoID
    var isPlayer = true
    let userID = GameDataBase.userID
    
    @IBOutlet weak var codeTextField: UITextField!
    
    weak var coordinator: MainCoordinator?
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func joinGameTapped(_ sender: Any) {
        
        let code = codeTextField.text
        if code == "" {
            //#warning("Handle the error")
        } else {
            
            reference.child("code").observeSingleEvent(of: .value) { (snapshot) in
                
                let codeFromDB = snapshot.value as! String
                print(codeFromDB)
                if codeFromDB == code! {
                    
                    self.userReference.setValue(["name": self.userID, "geoLocation": "futureGeoLocation"])
                    self.coordinator?.goToTimerView(asPlayer: self.isPlayer)
                } else {
                    // handle error
                    
                }
                
            }
        }
    }
}
