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
    weak var coordinator: MainCoordinator?
    var reference = GameDatabase.reference
    var userReference = GameDatabase.userRefByName
    var isHider = true
    let username = GameDatabase.userName
    
    @IBOutlet var instructionsLabel: UILabel!
    @IBOutlet weak var codeTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }  
    
    @IBAction func joinGameTapped(_ sender: Any) {
        let code = codeTextField.text
        if code == "" {
            instructionsLabel.textColor = .red
            instructionsLabel.text = "Please ask for the code from the Seeker, to play!"
            
        } else {
    
            reference.child("code").observeSingleEvent(of: .value) { (snapshot) in
                let codeFromDB = snapshot.value as? String
                
                if codeFromDB == code! {
                    self.userReference.setValue(["name": self.username!])
                    self.coordinator?.goToTimerView(asHider: self.isHider)
                    
                } else {
                    self.instructionsLabel.textColor = .red
                    self.instructionsLabel.text = "That's not correct, please ask again!"
                }
            }
        }
    }
}
