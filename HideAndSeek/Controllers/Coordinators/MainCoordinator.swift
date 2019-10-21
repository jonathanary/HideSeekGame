//
//  MainCoordinator.swift
//  HideAndSeek
//
//  Created by Jonathan on 2019. 02. 04..
//  Copyright © 2019. Jonathan. All rights reserved.
//

import UIKit

protocol Coordinator {
    var navigationController: UINavigationController {get set}
}

/// The main coordinator of the app.
class MainCoordinator: Coordinator {
    var navigationController: UINavigationController
    var isHiding = true

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
		start()
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
        isHiding = false
        let viewController = InvitePlayersViewController.instantiate()
        viewController.coordinator = self
        navigationController.pushViewController(viewController, animated: true)
    }

    func goToTypeCodeView() {
        isHiding = true
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
        if isHiding {
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
