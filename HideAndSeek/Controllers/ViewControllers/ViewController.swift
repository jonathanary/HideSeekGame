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
        setup()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    func setup() {
        Auth.auth().addStateDidChangeListener() { [weak self](auth, user) in
            
            guard let strongSelf = self else { return }
            if let user = user {
                print("User is signed in with uid:", user.uid)
                if !strongSelf.didGoToNextView {
                    strongSelf.coordinator?.goToChooseView()
                }
                strongSelf.didGoToNextView = true
            } else {
                print("No user is signed in.")
                strongSelf.didGoToNextView = false
            }
        }
    }
    
    @IBAction func loginTapped(_ sender: Any) {
        let authUi = FUIAuth.defaultAuthUI()
        guard authUi != nil else { return }
        authUi?.delegate = self
        let authViewController = authUi!.authViewController()
        present(authViewController, animated: true, completion: nil)
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
