//
//  ViewController.swift
//  fifteenGame
//
//  Created by Admin on 21.09.2018.
//  Copyright © 2018 Admin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var mainStack: UIStackView!
    @IBOutlet weak var stack1: UIStackView!
    @IBOutlet weak var stack2: UIStackView!
    @IBOutlet weak var stack3: UIStackView!
    @IBOutlet weak var stack4: UIStackView!
   
    override func viewDidLoad() {
        super.viewDidLoad()
    print("did load")
   var arrayButtos = mainStack.subviews
        
        
        
    }


    
    func buttonTouch(button sender: UIButton) {
        UIView.animate(withDuration: 2, delay: 0, options: [], animations: {
            sender.alpha = 0.2
            sender.isHidden = true
        }) { (finish) in
            
        }
    }
    
    
    @IBAction func buttoPressed(_ sender: UIButton) {
    buttonTouch(button: sender)
    }
    

}

