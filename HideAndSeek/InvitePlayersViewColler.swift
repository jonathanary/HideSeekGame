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
    let date = GameDate.shared() // this should be a singleton
    var startReference = Database.database().reference()
    //let reference = Database.database().reference().child(date)
    let userID = Auth.auth().currentUser?.uid
    let userName = Auth.auth().currentUser?.displayName
    
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
    var isPlayer = false
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        startReference = startReference.child(date)
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
            startReference.child("code").setValue(trimmedCode)
            //reference.child("someID/name").setValue(codeTextField.text)
            startReference.child("code").observeSingleEvent(of: .value) { (snapshot) in
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
        coordinator?.goToTimerView(asPlayer: isPlayer)
    }
}
