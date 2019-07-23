//
//  FireDatabaseModel.swift
//  HideAndSeek
//
//  Created by Jonathan on 2019. 02. 07..
//  Copyright © 2019. Jonathan. All rights reserved.
//

import Foundation
import FirebaseDatabase
import FirebaseAuth

class GameDatabase {
    static let gameReference = Database.database().reference().child(GameDate.shared())
    static let userName = Auth.auth().currentUser?.displayName
}

extension GameDatabase {
    static func setCode(_ code: String) {
        GameDatabase.gameReference.child("code").setValue(code)
    }
    static var timerReference = GameDatabase.gameReference.child("Timer")
    static var userRefByName = GameDatabase.gameReference.child(GameDatabase.userName!)
}
