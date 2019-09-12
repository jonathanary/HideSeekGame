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
    fileprivate let reference = GameDatabase.gameReference
    fileprivate let timerFireBase = GameDatabase.timerReference
    var players = [Player]()
    var isHider = false
    
    @IBOutlet weak var playersNameListLabel: UILabel!
    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var secondsLabel: UILabel!
    @IBOutlet weak var startTimeLabel: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
//    override func viewWillAppear(_ animated: Bool) {
//        navigationController?.setNavigationBarHidden(true, animated: true)
//    }
    
    func setup() {
        self.playersNameListLabel.text = ""
        
        reference.observe(.childAdded) { (snapshot) in
            
            if let dictionary = snapshot.value as? [String: AnyObject] {
                self.players = [Player]()
                let player = Player()
                player.name = dictionary["name"] as? String
                self.players.append(player)
                
                for aPlayer in (self.players) {
                    self.playersNameListLabel.text?.append("\(aPlayer.name ?? "") ")
                }
            }
        }
        
        if isHider {
            timerLabel.text = "Run and Hide!"
            startTimeLabel.isHidden = true
            
            timerFireBase.observe(.value) { (snapshot) in
                if let secondsLeftToHide = snapshot.value as? Int {
                    self.secondsLabel.text = String(secondsLeftToHide)
                    
                    if secondsLeftToHide == 55 {
                        self.coordinator?.goToHidersView()
                    }
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
            
            if runCount == 50 {
                gameTimer.invalidate()
                self.coordinator?.goToSeekersView(asHider: self.isHider)
                self.timerFireBase.setValue(60)
            }
        }
    }
}


