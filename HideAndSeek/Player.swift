//
//  Player.swift
//  HideAndSeek
//
//  Created by Jonathan on 2019. 02. 07..
//  Copyright © 2019. Jonathan. All rights reserved.
//

import Foundation


//protocol Player {
//    var id: String { get set }
//    var name: String { get set }
//    var status: Status { get set }
//}

struct Player {
    var id: String
    var name: String
    var status: Status?
}

enum Status {
    case it
    case normalPlayer
    case unknown
}
