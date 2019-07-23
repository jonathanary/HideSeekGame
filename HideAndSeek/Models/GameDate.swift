//
//  GameDate.swift
//  HideAndSeek
//
//  Created by Jonathan on 2019. 02. 11..
//  Copyright © 2019. Jonathan. All rights reserved.
//

import Foundation

class GameDate {
    
    private static var formattedDate = { ()-> String in
        var date = Date()
        var dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMMM-dd-yyyy"
        return dateFormatter.string(from: date)
    }
    
    class func shared() -> String {
        return formattedDate()
    }
}
