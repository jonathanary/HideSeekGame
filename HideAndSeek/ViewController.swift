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
        
        // MARK: FIREBASE TUTORIAL
        
        //How to make a reference to your database
        // let reference = Database.database().reference()
        //How to change a value
        //reference.child("someID/name").setValue("Jonathan")
        //reference.childByAutoId().setValue(["name":"Tom", "role": "admin", "age":44])
        
        // How to delete a value
        //reference.child("-LXsneEqLOOIoFRIMu4w").removeValue()
        
        // how to update some values
        //        let updates = ["-LXsomZ007Jir6r0vfnt/name":"papageno", ]
        //        reference.updateChildValues(updates)
        //        reference.child("someID").observeSingleEvent(of: .value) { (snapshot) in
        //            let data = snapshot.value as? [String:Any]
        //            print(data! as Any)
        //        }
        
        
    }
    
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
        guard error == nil else { return }
        //let uid = authDataResult?.user.uid   ====> the user's uid
        coordinator?.goToLoginView()
    }
    
}
