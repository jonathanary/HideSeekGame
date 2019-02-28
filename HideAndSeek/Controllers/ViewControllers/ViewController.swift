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
    override func viewDidLoad() {
        super.viewDidLoad()
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
        coordinator?.goToLoginAndChoseView()
        
    }
}
