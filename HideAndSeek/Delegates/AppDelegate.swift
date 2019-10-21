//
//  AppDelegate.swift
//  HideAndSeek
//
//  Created by Jonathan on 2019. 02. 04..
//  Copyright © 2019. Jonathan. All rights reserved.
//

import UIKit
import Firebase
import CoreLocation
import UserNotifications

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var coordinator: MainCoordinator?
    var window: UIWindow?

	func application(
		_ application: UIApplication,
		didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let navigationController = UINavigationController()
        coordinator = MainCoordinator(navigationController: navigationController)
        assert(coordinator != nil, "You must set a coordinator before presenting this view controller.")
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
        FirebaseApp.configure()
        return true
    }
}
