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

let date = GameDate.shared()

class GameDatabase {
    
    private init () {}
    static let reference = Database.database().reference().child(date)
    static let userName = Auth.auth().currentUser?.displayName
    var code = ""
    
    //For Future usage, whenever the players want to restart the game as is
    init?(codeSnapshot: DataSnapshot) {
        GameDatabase.reference.child("code").observe(.value) { (snapshot) in
            self.code = snapshot.value as! String
        }
    }
}

extension GameDatabase {
    static func setCode(_ code: String) {
        GameDatabase.reference.child("code").setValue(code)
    }
    static var timerReference = GameDatabase.reference.child("Timer")
    static var newCode = ""
    static var userRefByName = GameDatabase.reference.child(GameDatabase.userName!)
}
