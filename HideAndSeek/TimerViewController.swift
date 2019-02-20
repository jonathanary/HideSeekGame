//
//  TimerViewController.swift
//  HideAndSeek
//
//  Created by Jonathan on 2019. 02. 08..
//  Copyright © 2019. Jonathan. All rights reserved.
//

import UIKit
import FirebaseDatabase


class TimerViewController: UIViewController, Storyboarded {
    
    weak var coordinator: MainCoordinator?
    var isPlayer = true
    var reference = GameDataBase.reference
    var timerFireBase = GameDataBase.timerReference

    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var secondsLabel: UILabel!
    @IBOutlet weak var startTimeLabel: UIButton!
    @IBOutlet weak var playersNameListLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if isPlayer == true {
            timerLabel.text = "Run and Hide!"
            startTimeLabel.isHidden = true
            timerFireBase.observe(.value) { (snapshot) in
                print(snapshot)
                if let secondsLeftToHide = snapshot.value as? Int {
                    print(secondsLeftToHide)
                    self.secondsLabel.text = String(secondsLeftToHide)
                    if secondsLeftToHide == 0 {
                        self.coordinator?.goToSeekersView(asPlayer: self.isPlayer)
                    }
                }
            }
            
        } else {
            
            var names = [String]()
            self.playersNameListLabel.text = ""
            reference.observe(.childAdded) { (snapshot) in
                
                if let player = Player(snapshot: snapshot) {
                    let pName = player.name
                    print(pName)
                    names.append(pName)
                    for name in names {
                        self.playersNameListLabel.text?.append(contentsOf: name)
                    }
                    self.playersNameListLabel.text?.append(" joined the game!")
                }
            }
        }
        
        
        
    }
    
    @IBAction func startTimerTapped(_ sender: Any) {
        timerLabel.text = "Wait for it!"
        startTimeLabel.isHidden = true
        var gameTimer: Timer!
        var runCount = 60
        gameTimer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { timer in
            runCount -= 1
            self.secondsLabel.text = ("\(runCount)")
            self.timerFireBase.setValue(runCount)
            if runCount == 0 {
                gameTimer.invalidate()
                
                // coordinator
                if self.isPlayer == true {
                    self.coordinator?.goToSeekersView(asPlayer: self.isPlayer)
                } else {
                    self.coordinator?.goToSeekersView(asPlayer: self.isPlayer)
                    self.timerFireBase.setValue(60)
                }
                
            }
        }
    }
}


