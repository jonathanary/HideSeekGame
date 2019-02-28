//
//  InvitePlayersViewColler.swift
//  HideAndSeek
//
//  Created by Jonathan on 2019. 02. 06..
//  Copyright © 2019. Jonathan. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase

class InvitePlayersViewController: UIViewController, Storyboarded {
    weak var coordinator: MainCoordinator?
    var reference = GameDatabase.gameReference
    var isHider = false
    
    @IBOutlet weak var codeTextField: UITextField!
    @IBOutlet weak var codeLabel: UILabel!
    @IBOutlet weak var saveLabel: UIButton!
    @IBOutlet weak var instructionsLabel: UILabel!
    @IBOutlet weak var startGameLabel: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        reference.removeValue()
        codeLabel.isHidden = true
        startGameLabel.isHidden = true
    }

    @IBAction func saveTapped(_ sender: Any) {
        let code = codeTextField.text
    
        if code == "" {
            instructionsLabel.textColor = .red
            instructionsLabel.text = "Please come up with a code ;)"
            
        } else {
            codeTextField.isHidden = true
            let trimmedCode = CodeTrimmers.trim(code)
            GameDatabase.setCode(trimmedCode)
            
            reference.child("code").observeSingleEvent(of: .value) { (snapshot) in
                let newCode = snapshot.value as! String
                print(newCode)
                self.codeLabel.text = newCode
                self.codeLabel.isHidden = false
                self.saveLabel.isHidden = true
                self.instructionsLabel.text = "Tell your code, so others can join!"
                self.startGameLabel.isHidden = false
            }
        }
    }
    
    @IBAction func startGameTapped(_ sender: Any) {
        coordinator?.goToTimerView(asHider: isHider)
    }
}
