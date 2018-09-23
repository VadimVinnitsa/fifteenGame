//
//  ViewController.swift
//  fifteenGame
//
//  Created by Admin on 21.09.2018.
//  Copyright © 2018 Admin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var row1: [UIButton]!
    @IBOutlet var row2: [UIButton]!
    @IBOutlet var row3: [UIButton]!
    @IBOutlet var row4: [UIButton]!
    var buttonArray = [[UIButton]]()
    var maxX = 4
    var maxY = 4
    
    var game = Game(numberOfCards: 16) //???
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("did load")
        print(game.cards)
        buttonArray.append(row1)
        buttonArray.append(row2)
        buttonArray.append(row3)
        buttonArray.append(row4)
        startRound()
        
    }
    
    func startRound() {
        print("new round")
        
        for i in buttonArray { //?? not work
            for j in i {
                //  myButton.titleLabel?.font =  UIFont(name: YourfontName, size: 20)
                j.titleLabel?.font = UIFont.boldSystemFont(ofSize: 60)
                j.titleLabel?.textColor = .black
                
            }
        }
        
        game.shuffle()
        refreshViewFromModel()
    }
    
    func refreshViewFromModel () {
    
        
        
        for i in 0 ..< maxX {
            for j in 0 ..< maxY {
                buttonArray[i][j].setTitle(String(game.cards[i][j].number), for: .normal)
                buttonArray[i][j].alpha = 1
                buttonArray[i][j].isEnabled = true
                
                if game.cards[i][j].number == 0 {
                    buttonArray[i][j].alpha = 0.1
                    buttonArray[i][j].isEnabled = false
                }
            }
        }
    }
    
    func ifUCanMoveMove(sender: UIButton) -> Bool {
        var x = 0
        var y = 0
        var zeroX = 0
        var zeroY = 0
        
        for i in 0 ..< maxX {
            for j in 0 ..< maxY {
                if buttonArray[i][j] == sender { //find index button pressed
                    x = i
                    y = j
                }
                if game.cards[i][j].number == 0 { // find index zero card
                    zeroX = i
                    zeroY = j
                }
            }
        }
        
        if (zeroX == x && zeroY-1 == y) || (zeroX == x && zeroY+1 == y) || (zeroY == y && zeroX-1 == x) || (zeroY == y && zeroX + 1 == x) {
            let tempCard = game.cards[zeroX][zeroY]
            game.cards[zeroX][zeroY] = game.cards[x][y] //?? what i do this???
            game.cards[x][y] = tempCard
            return true
        }
        
        return false
    }
    
    
    func isWin() -> Bool {
        var currentNumber = game.cards[0][0].number
        for i in 0..<maxX {
            for j in 0..<maxY {
                if game.cards[i][j].number == currentNumber {
                    currentNumber += 1
                } else {
                    return false
                }
            }
        }
        return true
    }
    
    func buttonTouch(button sender: UIButton) {
        if ifUCanMoveMove(sender: sender)
        {
            refreshViewFromModel()
        }
        if isWin() {
            print("Wins")
            startRound()
        }
        
        
    }
    
    @IBAction func ButtonPressed(_ sender: UIButton) {
        buttonTouch(button: sender)
    }
    
    
    @IBAction func newRoundPressed(_ sender: UIButton) {
        startRound()
    }
    
    
}

