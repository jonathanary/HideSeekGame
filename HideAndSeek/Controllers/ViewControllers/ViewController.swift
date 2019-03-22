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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Auth.auth().addStateDidChangeListener() { (auth, user) in
            if let user = user {
                print("User is signed in with uid:", user.uid)
                self.coordinator?.goToChooseView()
            } else {
                print("No user is signed in.")
            }
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(true, animated: false)
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
        coordinator?.goToChooseView()
    }
}
