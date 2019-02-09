//
//  TimerViewController.swift
//  HideAndSeek
//
//  Created by Jonathan on 2019. 02. 08..
//  Copyright © 2019. Jonathan. All rights reserved.
//

import UIKit

class TimerViewController: UIViewController, Storyboarded {
    
    weak var coordinator: MainCoordinator?
    var isPlayer = true

    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var secondsLabel: UILabel!
    @IBOutlet weak var startTimeLabel: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if isPlayer == true {
            timerLabel.text = "Run and Hide!"
            startTimeLabel.isHidden = true
        } else {
            //
        }
    }
    
    @IBAction func startTimerTapped(_ sender: Any) {
        timerLabel.text = "Wait for it!"
        startTimeLabel.isHidden = true
        var gameTimer: Timer!
        var runCount = 60
        gameTimer  = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { timer in
            runCount -= 1
            self.secondsLabel.text = ("\(runCount)")
            if runCount == 0 {
                gameTimer.invalidate()
                
                // coordinator new view
                
            }
        }
    }
}


