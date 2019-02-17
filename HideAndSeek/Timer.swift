//
//  Timer.swift
//  HideAndSeek
//
//  Created by Jonathan on 2019. 02. 08..
//  Copyright © 2019. Jonathan. All rights reserved.
//




import UIKit
class TimerTest: NSObject {
    var runCount: Int = Int()
    var myTimer:Timer?
    override init() {
        super.init()
        print("init worked")
        myTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: Selector(("timerFuncTriggered")), userInfo: nil, repeats: true)
        
    }
    
    
    
    func timerFuncTriggered(timer:Timer) {
        print("timer started")
        
    }
}
