//
//  Timer.swift
//  HideAndSeek
//
//  Created by Jonathan on 2019. 02. 08..
//  Copyright © 2019. Jonathan. All rights reserved.
//

//import Foundation

//class Counter {
//
//    var timer: Timer
//    var runCount = 0
//    init() {
//        timer = Timer.init(timeInterval: 1.0, target: Counter.self, selector: #selector(fireTimer), userInfo: nil, repeats: true)
//    }
//    @objc func fireTimer(_: Timer) {
//        print("Timer fired")
//        runCount += 1
//        if runCount == 60 {
//            timer.invalidate()
//        }
//    }
//}


//class MyTimer: NSObject {
//
//    var startTime = TimeInterval()
//    var time: Double = 4
//    var timer = Timer()
//    var timerEndedCallback: (() -> Void)!
//    var timerInProgressCallback: ((_ elapsedTime: Double) -> Void)!
//
//    func startTimer(timerEnded: @escaping () -> Void, timerInProgress: ((_ elapsedTime: Double) -> Void)!) {
//        if !timer.isValid {
//            let aSelector = #selector(MyTimer.updateTime)
//            timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: aSelector, userInfo: nil, repeats: true)
//            startTime = 60.0
//            timerEndedCallback = timerEnded
//            timerInProgressCallback = timerInProgress
//        }
//    }
//
//    @objc func updateTime() {
//
//        var currentTime = NSDate.timeIntervalSinceReferenceDate
//        var elapsedTime = currentTime - startTime
//        var seconds = time - elapsedTime
//
//        if seconds > 0 {
//            elapsedTime -= TimeInterval(seconds)
//            timerInProgressCallback(elapsedTime)
//        } else {
//            timer.invalidate()
//            timerEndedCallback()
//        }
//    }
//}


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
