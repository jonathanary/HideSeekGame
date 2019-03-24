//
//  LoginViewController.swift
//  HideAndSeek
//
//  Created by Jonathan on 2019. 02. 04..
//  Copyright © 2019. Jonathan. All rights reserved.
//

import UIKit
import FirebaseAuth

class ChooseViewController: UIViewController, Storyboarded {
    weak var coordinator: MainCoordinator?
    @IBOutlet var iHideButton: UIButton!
    @IBOutlet var iSeekButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let backItem = UIBarButtonItem(title: "Log out", style: .plain, target: self, action: #selector(logoutTapped))
        self.navigationItem.leftBarButtonItem = backItem
    }
    
    @objc func logoutTapped() {
        coordinator?.start()
        do {
            try Auth.auth().signOut()
            self.dismiss(animated: true, completion: nil)
        } catch let err {
            print(err)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(false, animated: true)
    }

    @IBAction func imASeekerButtonTapped(_ sender: Any) {
        coordinator?.goToInviteView()
    }
    
    @IBAction func imAHiderTapped(_ sender: Any) {
        coordinator?.goToTypeCodeView()
    }
}
