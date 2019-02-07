//
//  CodeViewController.swift
//  HideAndSeek
//
//  Created by Jonathan on 2019. 02. 06..
//  Copyright © 2019. Jonathan. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase

class InvitePlayersViewColler: UIViewController, Storyboarded {

    weak var coordinator: MainCoordinator?
    let reference = Database.database().reference()
    
    // MARK: FIREBASE TUTORIAL
    
    //How to make a reference to your database
    // let reference = Database.database().reference()
    //How to change a value
    //reference.child("someID/name").setValue("Jonathan")
    //reference.childByAutoId().setValue(["name":"Tom", "role": "admin", "age":44])
    
    // How to delete a value
    //reference.child("-LXsneEqLOOIoFRIMu4w").removeValue()
    
    // how to update some values
    //        let updates = ["-LXsomZ007Jir6r0vfnt/name":"papageno", ]
    //        reference.updateChildValues(updates)
    //        reference.child("someID").observeSingleEvent(of: .value) { (snapshot) in
    //            let data = snapshot.value as? [String:Any]
    //            print(data! as Any)
    //        }
    @IBOutlet weak var codeTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func saveAndStartTapped(_ sender: Any) {
        
        let code = codeTextField.text
        if code == "" {
            reference.child("someID/name").setValue("Jonathan")
            //Handle error
        } else {
            
            reference.child("someID/name").setValue(codeTextField.text)
        }
    }
}
