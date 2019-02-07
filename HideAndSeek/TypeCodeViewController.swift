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
    
    let reference = Database.database().reference()
    let userID = Auth.auth().currentUser?.uid

    @IBOutlet weak var codeTextField: UITextField!
    weak var coordinator: MainCoordinator?
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func joinGameTapped(_ sender: Any) {
        let code = codeTextField.text
        if code == "" {
            //reference.child("someID/name").setValue("Jonathan")
            #warning("Handle the error")
        } else {
            reference.child("users").child("thisIsATest").child("code").observeSingleEvent(of: .value) { (snapshot) in
                let codeFromDB = snapshot.value as! String
                print(codeFromDB)
                if codeFromDB == code! {
                    if let id = self.userID {
                        self.reference.child("users").child("normalPlayers").setValue(id)
                    }
                    
                } else {
                    // handle error
                }
            }
        }
    }
}
