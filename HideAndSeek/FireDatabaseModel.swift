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
    static let userID = Auth.auth().currentUser?.uid
    var code = ""
    
//    init?(codeSnapshot: DataSnapshot) {
//        GameDataBase.reference.child("code").observe(.value) { (snapshot) in
//            self.code = snapshot.value as! String
//        }
//    }
}

extension GameDataBase {
    static func setCode(_ code: String) {
        GameDataBase.reference.child("code").setValue(code)
    }
    static var newCode = ""
    
//    static func getCode(_ completion: @escaping (String) -> Void) {
//        //#warning ("How to get a closure value?")
//    }
}
