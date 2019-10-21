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
    fileprivate let reference = GameDatabase.gameReference

    @IBOutlet weak var codeTextField: UITextField!
    @IBOutlet weak var codeLabel: UILabel!
    @IBOutlet weak var saveLabel: UIButton!
    @IBOutlet weak var instructionsLabel: UILabel!
    @IBOutlet weak var startGameLabel: UIButton!
    @IBOutlet var codeLabelToSafe: NSLayoutConstraint!
    @IBOutlet var stackToSafeAreaConstraint: NSLayoutConstraint!
    @IBOutlet var saveButtonToTextFieldConstraint: NSLayoutConstraint!
    @IBOutlet var startButtonToTextFieldConstraint: NSLayoutConstraint!

    override func viewDidLoad() {
        super.viewDidLoad()
        assert(coordinator != nil, "You must set a coordinator before presenting this view controller.")
        setup()
    }

    func setup() {
        reference.removeValue()
        codeLabel.isHidden = true
        startGameLabel.isHidden = true
        NotificationCenter.default.addObserver(
			self,
			selector: #selector(InvitePlayersViewController.keyboardWillShow(_:)),
			name: UIResponder.keyboardWillShowNotification,
			object: nil)
        NotificationCenter.default.addObserver(
			self,
			selector: #selector(InvitePlayersViewController.keyboardWillResign(_:)),
			name: UIResponder.keyboardWillHideNotification,
			object: nil)
    }

    @IBAction func saveTapped(_ sender: Any) {
        let code = codeTextField.text

        if code == "" {
            self.instructionsLabel.shadowColor = nil
            self.instructionsLabel.font = self.instructionsLabel.font.withSize(16)
            self.instructionsLabel.textColor = .orange
            instructionsLabel.text = "Please come up with a code ;)"

        } else {
            codeTextField.isHidden = true
            let trimmedCode = CodeTrimmers.trim(code)
            GameDatabase.setCode(trimmedCode)

            reference.child("code").observeSingleEvent(of: .value) { (snapshot) in
				guard snapshot.value is String else { return }
                let newCode = snapshot.value as? String
                self.codeLabel.text = newCode
                self.codeLabel.isHidden = false
                self.saveLabel.isHidden = true
                self.instructionsLabel.font = self.instructionsLabel.font.withSize(35)
                self.instructionsLabel.textColor = .white
                self.instructionsLabel.text = "Tell your code, so others can join"
                self.startGameLabel.isHidden = false
            }
        }
    }

    @IBAction func startGameTapped(_ sender: Any) {
        coordinator?.goToTimerView(asHider: false)
    }
    @objc func keyboardWillShow(_ notification: Notification) {
        saveButtonToTextFieldConstraint.constant = 1
        startButtonToTextFieldConstraint.constant = 24
        stackToSafeAreaConstraint.constant = 1
        codeLabelToSafe.constant = 40

        UIView.animate(withDuration: 0.8) {
            self.view.layoutIfNeeded()
        }
    }
    @objc func keyboardWillResign(_ notification: Notification) {
        saveButtonToTextFieldConstraint.constant = 65
        UIView.animate(withDuration: 0.8) {
            self.view.layoutIfNeeded()
        }
    }
}

extension InvitePlayersViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
