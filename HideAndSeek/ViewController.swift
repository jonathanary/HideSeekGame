//
//  ViewController.swift
//  HideAndSeek
//
//  Created by Jonathan on 2019. 02. 04..
//  Copyright © 2019. Jonathan. All rights reserved.
//

import UIKit
import FirebaseDatabase

class ViewController: UIViewController, Storyboarded {

    override func viewDidLoad() {
        super.viewDidLoad()
        
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
        
        
    }


}

