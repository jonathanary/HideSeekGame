//
//  CodeTrimmer.swift
//  HideAndSeek
//
//  Created by Jonathan on 2019. 02. 12..
//  Copyright © 2019. Jonathan. All rights reserved.
//

import Foundation

struct CodeTrimmer {
    static func trim(_ str: String?) -> String {
        var trimmedStr = ""
        if let string = str {
            trimmedStr = string.replacingOccurrences(of: " ", with: "").lowercased()
        }
        return trimmedStr
    }
}
