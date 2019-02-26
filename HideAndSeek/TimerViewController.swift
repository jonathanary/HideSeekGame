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
    var isHider = false
    var reference = GameDataBase.reference
    var timerFireBase = GameDataBase.timerReference
    var players = [Player]()
    
    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var secondsLabel: UILabel!
    @IBOutlet weak var startTimeLabel: UIButton!
    @IBOutlet weak var playersNameListLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.playersNameListLabel.text = ""
        
        
        reference.observe(.childAdded) { (snapshot) in
            
            if let dictionary = snapshot.value as? [String: AnyObject] {
                self.players = [Player]()
                let player = Player()
                //player.setValuesForKeys(dictionary)
                player.name = dictionary["name"] as? String
                self.players.append(player)
               // print(self.players)
                for aPlayer in (self.players) {
                    self.playersNameListLabel.text?.append("\(aPlayer.name ?? "") ")
                    GameDataBase.hiders.append(aPlayer.name ?? "")
                }
                
            }
            
        }

        if isHider == true {
            timerLabel.text = "Run and Hide!"
            startTimeLabel.isHidden = true
            timerFireBase.observe(.value) { (snapshot) in
                print(snapshot)
                if let secondsLeftToHide = snapshot.value as? Int {
                    print(secondsLeftToHide)
                    self.secondsLabel.text = String(secondsLeftToHide)
                    if secondsLeftToHide == 60 {
                        self.coordinator?.goToHidersView()}
                    
                }
            }
            
            
            
        }
//        else {
//
//            //var names = [String]()
//            self.playersNameListLabel.text = ""
//
//            reference.observe(.childAdded) { (snapshot) in
//                self.players = [Player]()
//                if let dictionary = snapshot.value as? [String: AnyObject] {
//                    let player = Player()
//                    //player.setValuesForKeys(dictionary)
//                    player.name = dictionary["name"] as? String
//                    self.players.append(player)
//
//                    for aPlayer in (self.players) {
//                        self.playersNameListLabel.text?.append("\(aPlayer.name ?? "") ")
//                        GameDataBase.hiders.append(aPlayer.name ?? "")
//                    }
//
//                }
//
//            }
//
//        }
        
    }
    
    @IBAction func startTimerTapped(_ sender: Any) {
        self.isHider = false
        timerLabel.text = "Wait for it!"
        startTimeLabel.isHidden = true
        var gameTimer: Timer!
        var runCount = 60
        gameTimer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { timer in
            runCount -= 1
            self.secondsLabel.text = ("\(runCount)")
            self.timerFireBase.setValue(runCount)
            if runCount == 56 {
                gameTimer.invalidate()
                self.coordinator?.goToSeekersView(asHider: self.isHider)
                self.timerFireBase.setValue(60)
                // coordinator
//                if self.isHider == true {
//                    self.coordinator?.goToSeekersView(asHider: self.isHider)
//                } else {
//                    
//                }
                
            }
        }
    }
}


