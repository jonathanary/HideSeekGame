//
//  MainCoordinator.swift
//  HideAndSeek
//
//  Created by Jonathan on 2019. 02. 04..
//  Copyright © 2019. Jonathan. All rights reserved.
//

import UIKit

class MainCoordinator: Coordinator {
    var navigationController: UINavigationController
    var isHider = true

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        navigationController.viewControllers.removeAll()
        let viewController = ViewController.instantiate()
        viewController.coordinator = self
        navigationController.pushViewController(viewController, animated: false)
    }

    func goToChooseView() {
        let viewController = ChooseViewController.instantiate()
        viewController.coordinator = self
        navigationController.pushViewController(viewController, animated: true)
    }

    func goToInviteView() {
        isHider = false
        let viewController = InvitePlayersViewController.instantiate()
        viewController.coordinator = self
        navigationController.pushViewController(viewController, animated: true)
    }

    func goToTypeCodeView() {
        isHider = true
        let viewController = TypeCodeViewController.instantiate()
        viewController.coordinator = self
        navigationController.pushViewController(viewController, animated: true)
    }

    func goToTimerView(asHider: Bool) {
        let viewController = TimerViewController.instantiate()
        viewController.isHider = asHider
        viewController.coordinator = self
        navigationController.pushViewController(viewController, animated: true)
    }

    func goToSeekersView(asHider: Bool) {
        let viewController = SeekersViewController.instantiate()
        viewController.coordinator = self
        viewController.isHider = asHider
        navigationController.pushViewController(viewController, animated: true)
    }

    func goToHidersView() {
        if isHider {
            let viewController = HidersViewController.instantiate()
            viewController.coordinator = self
            navigationController.pushViewController(viewController, animated: true)
        }
    }

	func hidersViewDidDisappear(_ viewController: UIViewController) {
		for (index, controller) in navigationController.viewControllers.enumerated()
			where controller === viewController {
			navigationController.viewControllers.remove(at: index)
		}
	}

    func goToCatchView(with hider: String) {
        let viewController = CatchHiderViewController.instantiate()
        viewController.coordinator = self
        viewController.hider = hider
        navigationController.pushViewController(viewController, animated: true)
    }
}
