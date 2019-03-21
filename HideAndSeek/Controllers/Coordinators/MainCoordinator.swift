//
//  MainCoordinator.swift
//  HideAndSeek
//
//  Created by Jonathan on 2019. 02. 04..
//  Copyright © 2019. Jonathan. All rights reserved.
//

import UIKit

class MainCoordinator: Coordinator {
    //var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController
    var isHider = true
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let vc = ViewController.instantiate()
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: false)
    }
    
    func goToChooseView() {
        let vc = ChooseViewController.instantiate()
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: true)
    }
    
    func goToCodeView() {
        isHider = false
        let vc = InvitePlayersViewController.instantiate()
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: true)
    }
    
    func goToTypeCodeView() {
        isHider = true
        let vc = TypeCodeViewController.instantiate()
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: true)
    }
    
    func goToTimerView(asHider: Bool) {
        let vc = TimerViewController.instantiate()
        vc.isHider = asHider
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: true)
    }
    
    func goToSeekersView(asHider: Bool) {
        let vc = SeekersViewController.instantiate()
        vc.coordinator = self
        vc.isHider = asHider
        navigationController.pushViewController(vc, animated: true)
    }
    
    func goToHidersView() {
        print(isHider)
        if isHider {
            let vc = HidersViewController.instantiate()
            vc.coordinator = self
            navigationController.pushViewController(vc, animated: true)
        }
    }
    
    func hidersViewDidDisappear(_ viewController: UIViewController) {
        for (index, controller) in navigationController.viewControllers.enumerated() {
            if controller === viewController {
                navigationController.viewControllers.remove(at: index)
            }
        }
        
    }
    
    func goToCatchView(with hider: String) {
        let vc = CatchHiderViewController.instantiate()
        vc.coordinator = self
        vc.hider = hider
        navigationController.pushViewController(vc, animated: true)
    }
}
