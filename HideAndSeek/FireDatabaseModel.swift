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


struct FDatabase {
    private init () {}
    let reference = Database.database().reference().child("fir-crashcourse-32ce7").child("users").child("thisIsATest").child("code")
    
    
    
    let userID = Auth.auth().currentUser?.uid
        
    func getCode() {
        reference.observeSingleEvent(of: .childChanged) { (snapshot) in
            if let codeValue = snapshot.value as? [String:Any] {
                //print(codeValue["code"])
            }
        }
    }
    
}
