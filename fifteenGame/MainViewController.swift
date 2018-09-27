//
//  MainViewController.swift
//  fifteenGame
//
//  Created by Admin on 24.09.2018.
//  Copyright © 2018 Admin. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        print("main did load")
    
        
    }

    func createVC () {
        let vc = storyboard?.instantiateViewController(withIdentifier: ChooseGameTableViewController.storyboardID) as! ChooseGameTableViewController
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func playPressed(_ sender: UIButton) {
        createVC()
    }
    

    
    
}
