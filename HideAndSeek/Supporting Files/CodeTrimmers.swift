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
		let unicodeString = String(self).unicodeScalars
		return Int(unicodeString[unicodeString.startIndex].value)
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
        var number = 8549
        for character in username {
            let numberFromUsername = character.asciiValue
            number -= numberFromUsername
            if number < 0 {
                number += numberFromUsername
            }
        }
        return UInt16(number)
    }
}
