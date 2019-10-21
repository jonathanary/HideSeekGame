//
//  ViewController.swift
//  HideAndSeek
//
//  Created by Jonathan on 2019. 02. 04..
//  Copyright © 2019. Jonathan. All rights reserved.
//

import UIKit
import FirebaseDatabase
import FirebaseAuth
import FirebaseUI

class ViewController: UIViewController, Storyboarded {
    weak var coordinator: MainCoordinator?
    @IBOutlet var loginLabel: UIButton!
    var didGoToNextView = false

    override func viewDidLoad() {
        super.viewDidLoad()
        assert(coordinator != nil, "You must set a coordinator before presenting this view controller.")
        setup()
    }

    override func viewWillAppear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(true, animated: false)
    }

    func setup() {
		Auth.auth().addStateDidChangeListener { [weak self] _, user in
            guard let self = self else { return }
            if let user = user {
                print("User is signed in with uid:", user.uid)
                if !self.didGoToNextView {
                    self.coordinator?.goToChooseView()
                }
                self.didGoToNextView = true
            } else {
                print("No user is signed in.")
                self.didGoToNextView = false
            }
        }
    }

    @IBAction func loginTapped(_ sender: Any) {
        let fireBaseAuthUI = FUIAuth.defaultAuthUI()
        assert(fireBaseAuthUI != nil, "There should be a connection with the Firebase server.")
        guard fireBaseAuthUI != nil else { return }
        fireBaseAuthUI?.delegate = self
		if let authViewController = fireBaseAuthUI?.authViewController() {
        present(authViewController, animated: true, completion: nil)
		}
    }
}

extension ViewController: FUIAuthDelegate {
    func authUI(_ authUI: FUIAuth, didSignInWith authDataResult: AuthDataResult?, error: Error?) {

        guard error == nil else { return }

        if !self.didGoToNextView {
            coordinator?.goToChooseView()
            self.didGoToNextView = true

        } else {
            return
        }
    }
}
