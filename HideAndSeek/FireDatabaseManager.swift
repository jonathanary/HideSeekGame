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

class GameDataBase {
    private init () {}
    static let reference = Database.database().reference().child(date)
    
    //static let timerReference = Database.database().reference().child("\(date)TIMER")
    static let userID = Auth.auth().currentUser?.uid
    static let userName = Auth.auth().currentUser?.displayName
    var code = ""
    
    static var hiders = [String]()
    
    init?(codeSnapshot: DataSnapshot) {
        GameDataBase.reference.child("code").observe(.value) { (snapshot) in
            self.code = snapshot.value as! String
        }
    }
}

extension GameDataBase {
    static func setCode(_ code: String) {
        GameDataBase.reference.child("code").setValue(code)
    }
    static var timerReference = GameDataBase.reference.child("Timer")
    static var newCode = ""
    static var userRefByAutoID = GameDataBase.reference.child(GameDataBase.userName!)
//    static func getCode(_ completion: @escaping (String) -> Void) {
//        //#warning ("How to get a closure value?")
//    }
}
