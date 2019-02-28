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

struct CodeTrimmers {
    static func trim(_ str: String?) -> String {
        var trimmedStr = ""
        if let string = str {
            trimmedStr = string.replacingOccurrences(of: " ", with: "").lowercased()
        }
        return trimmedStr
    }
    
    static func setMajor(with username: String) -> UInt16 {
        var n = 8549
        for i in username {
            let numberFromUsername = i.asciiValue
            n -= numberFromUsername
            if n < 0 {
                n += numberFromUsername
            }
        }
        return UInt16(n)
    }
}

