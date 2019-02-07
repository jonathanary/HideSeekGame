//
//  LoginViewController.swift
//  HideAndSeek
//
//  Created by Jonathan on 2019. 02. 04..
//  Copyright © 2019. Jonathan. All rights reserved.
//

import UIKit

class ChooseViewController: UIViewController, Storyboarded {

    weak var coordinator: MainCoordinator?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    
    @IBAction func imItButtonTapped(_ sender: Any) {
        coordinator?.goToCodeView()
    }
    
    @IBAction func imAPlayerTapped(_ sender: Any) {
        coordinator?.goToCodeView()
    }
    
    
}
