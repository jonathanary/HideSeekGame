//
//  CodeTrimmer.swift
//  HideAndSeek
//
//  Created by Jonathan on 2019. 02. 12..
//  Copyright © 2019. Jonathan. All rights reserved.
//

import Foundation

extension Character {
    var asciiValue: Int {
        get {
            let s = String(self).unicodeScalars
            return Int(s[s.startIndex].value)
        }
    }
}

struct CodeTrimmer {
    static func trim(_ str: String?) -> String {
        var trimmedStr = ""
        if let string = str {
            trimmedStr = string.replacingOccurrences(of: " ", with: "").lowercased()
        }
        return trimmedStr
    }
}

//struct UsernameAsMajorBeacon {
//    static func getMajorBeacon(from username: String, _ major: Int) -> Int {
//        for i in username {
//            let numberFromUsername = i.asciiValue
//            
//            n -= numberFromUsername
//            if n < 0 {
//                n += numberFromUsername
//            }
//        }
//    }
//}

