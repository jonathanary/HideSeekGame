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
    let date = GameDate.shared()
    var startReference = GameDataBase.reference
    
    @IBOutlet weak var codeTextField: UITextField!
    @IBOutlet weak var codeLabel: UILabel!
    @IBOutlet weak var saveLabel: UIButton!
    @IBOutlet weak var instructionsLabel: UILabel!
    @IBOutlet weak var startGameLabel: UIButton!
    var isHider = false
    override func viewDidLoad() {
        super.viewDidLoad()
        
        codeLabel.isHidden = true
        startGameLabel.isHidden = true
    }

    @IBAction func saveTapped(_ sender: Any) {
        
        let code = codeTextField.text
        if code == "" {
            
            #warning("Handle the error")
            
        } else {
            
            codeTextField.isHidden = true
            //let trimmedCode = code!.replacingOccurrences(of: " ", with: "").lowercased()
            let trimmedCode = CodeTrimmer.trim(code)
            GameDataBase.setCode(trimmedCode)
            //startReference.child("code").setValue(trimmedCode)
            //GameDataBase.getCode(void)
            
            //print(newCode)
//            self.codeLabel.text = newCode
//            self.codeLabel.isHidden = false
//            self.saveLabel.isHidden = true
//            self.instructionsLabel.text = "Tell your code so others can join!"
//            self.startGameLabel.isHidden = false
            
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
        coordinator?.goToTimerView(asHider: false)
    }
}
