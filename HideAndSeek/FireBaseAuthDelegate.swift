//
//  FireBaseAuthDelegate.swift
//  HideAndSeek
//
//  Created by Jonathan on 2019. 02. 05..
//  Copyright © 2019. Jonathan. All rights reserved.
//

import UIKit
import FirebaseUI
import FirebaseAuth

//
//class FireBaseAuthDelegate: NSObject {
//    
//    func authenticate() -> UINavigationController? {
//        // get the default auth ui object
//        let authUi = FUIAuth.defaultAuthUI()
//        guard authUi != nil else { return nil }
//        // set ourselves as the delegate
//        authUi?.delegate = self
//        return authUi!.authViewController()
//        
//    }
//}
//
//extension FireBaseAuthDelegate: FUIAuthDelegate {
//    func authUI(_ authUI: FUIAuth, didSignInWith authDataResult: AuthDataResult?, error: Error?) {
//        // Check for errors
//        guard error == nil else { return }
//        //let uid = authDataResult?.user.uid   ====> the user's uid
//        //coordinator?.goToLoginView()
//    }
//}

