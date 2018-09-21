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
   
    @IBOutlet var buttons: [UIButton]!
    var dick = [Int: Int]()
    var game = Game(numberOfCards: 16) //???
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("did load")
        
        createDick()
        
    }

    func createDick() {
        var j = 0
        dick.removeAll()
        
        for i in game.cards {
            dick[j] = i.number
            j += 1
        }
        
    }
    
    func refreshViewFromModel () {
       createDick()
        for i in buttons.indices {
             buttons[i].setTitle(String(game.cards[i].number), for: .normal)
            
        }
       let zerroButton = dick[0]
        buttons[zerroButton!].alpha = 0.4
    }
    
    func canMove(sender: UIButton) -> Bool {
 
 //??????
        return true
    }
    
    
    func replaceCardInDick(sender: UIButton) {
       
        for i in game.cards.indices { //????
            if buttons[dick[i]] == sender {
                dick[i] = dick[0]
                
            }
        }
        
        dick[0] = sender
        
     
    }
    
    
    func buttonTouch(button sender: UIButton) {
        if canMove(sender: sender) {
        replaceCardInDick(sender: sender)
        }
        
        refreshViewFromModel()
    }
    
    
    @IBAction func buttoPressed(_ sender: UIButton) {
    buttonTouch(button: sender)
    }
    

}

