//
//  ChooseGameTableViewController.swift
//  fifteenGame
//
//  Created by Admin on 24.09.2018.
//  Copyright © 2018 Admin. All rights reserved.
//

import UIKit

class ChooseGameTableViewController: UITableViewController {
let identifier = "cell"
  var typeOfGames = [1,2,3,4,5,6]  //??
  static var storyboardID = "tableID"
    
    override func viewDidLoad() {
        super.viewDidLoad()
print("table did load")
        
        
    }


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return typeOfGames.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath)
        cell.detailTextLabel?.text = "detail"
        cell.textLabel?.text = String(typeOfGames[indexPath.row])
        
        return cell
    }

   override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            let vc = storyboard?.instantiateViewController(withIdentifier: ViewController.storyboardID) as! ViewController
            navigationController?.pushViewController(vc, animated: true)
        }
    }

}
