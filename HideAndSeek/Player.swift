//
//  Player.swift
//  HideAndSeek
//
//  Created by Jonathan on 2019. 02. 07..
//  Copyright © 2019. Jonathan. All rights reserved.
//

import Foundation
import MapKit
import FirebaseDatabase

class Player: NSObject {

    var name: String
    var geoLocation: String
    var code: String?
    let ref: DatabaseReference?

    init(name: String, location: String) {
        self.name = name
        self.geoLocation = location
        self.ref = nil
    }

    init?(snapshot: DataSnapshot) {
        guard let values = snapshot.value as? [String: Any] else { return nil }
        
        self.name = values["name"] as! String //Do it differently when there are no names
        self.geoLocation = values["geoLocation"] as! String
        self.ref = snapshot.ref
    }

}

// rewritten



//struct PlayersData: Sequence {
//    let players: [PlayerByAutoID]
//    //let code: String?
//
//    init?(snapshot: DataSnapshot) {
//        guard let players = snapshot.value as? [PlayerByAutoID] else { return nil }
//        self.players = players
//        for player in players {
//
//        }
//
//    }
//}
//
//struct PlayerByAutoID: Hashable {
//    let name: String
//    let geoLocation: String
//}
