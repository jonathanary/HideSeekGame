//
//  BackgroundColorProvider.swift
//  HideAndSeek
//
//  Created by Jonathan on 2019. 02. 26..
//  Copyright © 2019. Jonathan. All rights reserved.
//

import UIKit
import GameKit

struct BackgoundColorProvider {
    let colors = [
        UIColor(red: 90/255.0, green: 187/255.0, blue: 181/255.0, alpha: 1.0), //teal color
        .brown, //brown
        .cyan, //red
        .magenta, //magenta
        UIColor(red: 77/255.0, green: 75/255.0, blue: 82/255.0, alpha: 1.0), //dark color
        UIColor(red: 105/255.0, green: 94/255.0, blue: 133/255.0, alpha: 1.0), //purple color
        UIColor(red: 85/255.0, green: 176/255.0, blue: 112/255.0, alpha: 1.0), //green color
    ]
    
    func randomColor() -> UIColor {
        let randomNumber = GKRandomSource.sharedRandom().nextInt(upperBound: colors.count)
        return colors[randomNumber]
    }
}
