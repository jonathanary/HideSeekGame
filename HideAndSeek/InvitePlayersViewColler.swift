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
    let userID = Auth.auth().currentUser?.uid
    
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
    // aryjonathan90@gmail.com
    @IBOutlet weak var codeTextField: UITextField!
    @IBOutlet weak var codeLabel: UILabel!
    @IBOutlet weak var saveLabel: UIButton!
    @IBOutlet weak var instructionsLabel: UILabel!
    @IBOutlet weak var startGameLabel: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        codeLabel.isHidden = true
        startGameLabel.isHidden = true
        // Do any additional setup after loading the view.
    }

    @IBAction func saveTapped(_ sender: Any) {
        
        let code = codeTextField.text
        if code == "" {
            //reference.child("someID/name").setValue("Jonathan")
            #warning("Handle the error")
        } else {
            codeTextField.isHidden = true
            let trimmedCode = code!.replacingOccurrences(of: " ", with: "").lowercased()
            reference.child("users").child("thisIsATest").setValue(["username": "Somebody", "code": trimmedCode])
            //reference.child("someID/name").setValue(codeTextField.text)
            reference.child("users").child("thisIsATest").child("code").observeSingleEvent(of: .value) { (snapshot) in
                let newCode = snapshot.value as! String
                print(newCode)
                self.codeLabel.text = newCode
                self.codeLabel.isHidden = false
                self.saveLabel.isHidden = true
                self.instructionsLabel.text = "Tell your code so others can join!"
                self.startGameLabel.isHidden = false
            }
        }
    }
    
    
    @IBAction func startGameTapped(_ sender: Any) {
    }
}
