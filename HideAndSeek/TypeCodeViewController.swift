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
    
    let date = GameDate.shared()
    var reference = Database.database().reference()
    let userID = Auth.auth().currentUser?.uid
    var isPlayer = true

    @IBOutlet weak var codeTextField: UITextField!
    
    weak var coordinator: MainCoordinator?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        reference = reference.child(date)
    }

    @IBAction func joinGameTapped(_ sender: Any) {
        let code = codeTextField.text
        if code == "" {
            //reference.child("someID/name").setValue("Jonathan")
            #warning("Handle the error")
        } else {
            reference.child("code").observeSingleEvent(of: .value) { (snapshot) in
                let codeFromDB = snapshot.value as! String
                print(codeFromDB)
                if codeFromDB == code! {
                    
                    self.reference.childByAutoId().setValue(["name": self.userID, "geoLocation": "futureGeoLocation"])
                    self.coordinator?.goToTimerView(asPlayer: self.isPlayer)
                    
                    if let id = self.userID {
                       print(id)
                    }
                    
                } else {
                    // handle error
                }
            }
        }
    }
}
