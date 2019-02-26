//
//  SeekersDataSource.swift
//  HideAndSeek
//
//  Created by Jonathan on 2019. 02. 23..
//  Copyright © 2019. Jonathan. All rights reserved.
//

import UIKit
import Firebase

class SeekersDataSource: NSObject, UITableViewDataSource {
    //var hiders = [Player]()
    
    //var objects = [Any]()
    
//    func fetchUser() {
//
//                //print(self.hiders)
//            }
//        }
//    }
    
//    func numberOfSections(in tableView: UITableView) -> Int {
//        return 1
//    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //fetchUser()
        //print(hiders.count)
        return 5
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        //let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "Cell")
        var hiders = [Player]()
        GameDataBase.reference.observe(.childAdded) { (snapshot) in
            if let dictionary = snapshot.value as? [String: AnyObject] {
                let player = Player()
                
                player.name = dictionary["name"] as? String
                print(player.name ?? "")
                hiders.append(player)
                print(hiders)
            }
        }
        var hider = hiders[0]
        cell.textLabel!.text = hider.name
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    
//    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
//        if editingStyle == .delete {
//            hiders.remove(at: indexPath.row)
//            tableView.deleteRows(at: [indexPath], with: .fade)
//        } else if editingStyle == .insert {
//            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
//        }
//    }

}

