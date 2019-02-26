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

    
//    var geoLatitude: String?
//    var geoLongitude: String?
    var name: String?
    //var geoLocation: String
    //var code: String?
    //let ref: DatabaseReference?

//    init(name: String, latitude: CLLocationDegrees, longitude: CLLocationDegrees) {
//        self.name = name
//        self.latitude = latitude
//        self.longitude = longitude
//        self.ref = nil
//    }

//    init?(snapshot: DataSnapshot) {
//        guard let values = snapshot.value as? [String: Any] else { return nil }
//        
//        self.name = values["name"] as? String //Do it differently when there are no names
//        self.latitude = values["geoLatitude"] as? CLLocationDegrees
//        self.longitude = values["geoLongitude"] as? CLLocationDegrees
//        self.ref = snapshot.ref
//    }

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
