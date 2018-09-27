//
//  ViewController.swift
//  fifteenGame
//
//  Created by Admin on 21.09.2018.
//  Copyright © 2018 Admin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    static var storyboardID = "gameID"
    @IBOutlet var row1: [UIButton]!
    @IBOutlet var row2: [UIButton]!
    @IBOutlet var row3: [UIButton]!
    @IBOutlet var row4: [UIButton]!
    var buttonArray = [[UIButton]]()
    var maxX = 4
    var maxY = 4
    var currentTime = 70 //0
    @IBOutlet weak var timeLabel: UILabel!
    
    var myTimer = Timer()
    var game = Game(numberOfCards: 16) //???
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("did load")
        
        buttonArray.append(row1)
        buttonArray.append(row2)
        buttonArray.append(row3)
        buttonArray.append(row4)
        startRound()
        
     
        
    }
    
    func startRound() {
        print("new round")
        myTimer.invalidate()
        currentTime = 70 // ?? make 0
        
        myTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(funcForTimer), userInfo: nil, repeats: true)
        
        for i in buttonArray { //?? not work
            for j in i {
                //  myButton.titleLabel?.font =  UIFont(name: YourfontName, size: 20)
                j.titleLabel?.font = UIFont.boldSystemFont(ofSize: 60)
                j.titleLabel?.textColor = .black
                
            }
        }
        
        game.shuffleCards()
        refreshViewFromModel()
    }
    
    @objc func funcForTimer() {
        currentTime += 1
        refreshTimerLabel()
    }
    
    func refreshTimerLabel() {
        let formatter : DateComponentsFormatter = {
            let formatter = DateComponentsFormatter()
            formatter.allowedUnits = [.hour, .minute, .second]
            return formatter
        }()
        
        timeLabel.text = formatter.string(from: TimeInterval(currentTime))!
        
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
    
    func isCanMove(sender: UIButton) -> Bool {
    let t = findCurrentAndZeroCardIndex(sender: sender)
      if  ( ((t.zeroX == t.currentX) && (t.zerroY-1 == t.currentY || t.zerroY+1 == t.currentY)) || ((t.zerroY == t.currentY) && (t.zeroX-1 == t.currentX || t.zeroX + 1 == t.currentX )))
        { return true  }
        return false
    }
    
    func move (sender: UIButton) {
    let t = findCurrentAndZeroCardIndex(sender: sender)
      
            let tempCard = game.cards[t.zeroX][t.zerroY]
            game.cards[t.zeroX][t.zerroY] = game.cards[t.currentX][t.currentY] //?? what i do this???
            game.cards[t.currentX][t.currentY] = tempCard
    }
    
    func findCurrentAndZeroCardIndex(sender : UIButton) -> (currentX : Int, currentY : Int, zeroX : Int, zerroY : Int) {
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
        return (x,y,zeroX,zeroY)
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
        if isCanMove(sender: sender) {
            move(sender: sender)
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
  
    
    @IBAction func hidePressed(_ sender: UIButton) {
   
    }
   
    @IBAction func showPressed(_ sender: UIButton) {
    let v = Bundle.main.loadNibNamed("memu", owner: self, options: nil)![0] as! menuView //?? where need make constraint
        v.delegate = self
       
        v.translatesAutoresizingMaskIntoConstraints = false
//        NSLayoutConstraint.activate([
//            v.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
//            v.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 100),
//            v.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.8),
//            v.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.2)
//            ])
//
        view.addSubview(v)
        
        NSLayoutConstraint.activate([
            v.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            v.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 100),
            v.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.8),
            v.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.2)
            ])
        
        
    }
    
}

extension ViewController: SomeProtocol {
    func someF() {
        startRound()
    }
    
}
