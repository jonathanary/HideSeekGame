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
    @IBOutlet var iHideButton: UIButton!
    @IBOutlet var iSeekButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(false, animated: true)
    }

    @IBAction func imASeekerButtonTapped(_ sender: Any) {
        coordinator?.goToCodeView()
    }
    
    @IBAction func imAHiderTapped(_ sender: Any) {
        coordinator?.goToTypeCodeView()
    }
}
