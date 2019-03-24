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
    var reference = GameDatabase.gameReference
    var userReference = GameDatabase.userRefByName
    let username = GameDatabase.userName
    
    @IBOutlet var instructionsLabelConstraint: NSLayoutConstraint!
    @IBOutlet var joinToInstructionsLabelConstraint: NSLayoutConstraint!
    @IBOutlet var instructionsLabel: UILabel!
    @IBOutlet weak var codeTextField: UITextField!
    
    override func viewDidLoad() {
        //instructionsLabel.isHidden = true
        super.viewDidLoad()
        
        NotificationCenter.default.addObserver(self, selector: #selector(TypeCodeViewController.keyboardWillShow(_:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(TypeCodeViewController.keyboardWillResign(_:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }  
    
    @IBAction func joinGameTapped(_ sender: Any) {
        let code = codeTextField.text
        if code == "" {
            //instructionsLabel.isHidden = false
            instructionsLabel.shadowColor = nil
            instructionsLabel.font = instructionsLabel.font.withSize(16)
            instructionsLabel.textColor = .orange
            instructionsLabel.text = "Please ask for the code from the Seeker, to play!"
            
        } else {
    
            reference.child("code").observeSingleEvent(of: .value) { (snapshot) in
                let codeFromDB = snapshot.value as? String
                
                if codeFromDB == code! {
                    self.userReference.setValue(["name": self.username!])
                    self.coordinator?.goToTimerView(asHider: true)
                    
                } else {
                    self.instructionsLabel.shadowColor = nil
                    self.instructionsLabel.font = self.instructionsLabel.font.withSize(20)
                    self.instructionsLabel.textColor = .red
                    self.instructionsLabel.text = "That's not correct, please ask again!"
                }
            }
        }
    }
    
    @objc func keyboardWillShow(_ notification: Notification) {
        instructionsLabelConstraint.constant = 1
        joinToInstructionsLabelConstraint.constant = 1
        
        UIView.animate(withDuration: 0.8) {
            self.view.layoutIfNeeded()
        }
    }
    
    @objc func keyboardWillResign(_ notification: Notification) {
        instructionsLabelConstraint.constant = 40
        UIView.animate(withDuration: 0.8) {
            self.view.layoutIfNeeded()
        }
    }
}

extension TypeCodeViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
