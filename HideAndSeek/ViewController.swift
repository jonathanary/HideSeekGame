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
    
    #warning("refactor")
    @IBAction func loginTapped(_ sender: Any) {
        // get the default auth ui object
        let authUi = FUIAuth.defaultAuthUI()
        guard authUi != nil else { return }
        // set ourselves as the delegate
        authUi?.delegate = self
        // get a reference to the auth UI view controller
        let authViewController = authUi!.authViewController()
        // show it
        present(authViewController, animated: true, completion: nil)
    }
}

extension ViewController: FUIAuthDelegate {
    
    func authUI(_ authUI: FUIAuth, didSignInWith authDataResult: AuthDataResult?, error: Error?) {
        // Check for errors
//        guard error == nil else { return }
//        if let uid = authDataResult?.user.uid {
//            let player = Player(id: uid, name: "Name")
//        }
        coordinator?.goToLoginAndChoseView()
    }
    
}
