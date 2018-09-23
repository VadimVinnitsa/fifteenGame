//
//  model.swift
//  fifteenGame
//
//  Created by Admin on 21.09.2018.
//  Copyright © 2018 Admin. All rights reserved.
//

import Foundation
import GameplayKit

class Game {
    var cards = [[Card]]()
    
    func shuffle() {
        cards = GKRandomSource.sharedRandom().arrayByShufflingObjects(in: cards) as! [[Card]] // do normar shuflle
        
    }
    
    
    init(numberOfCards: Int) { //only 16 const
        for i in 0 ..< 4 {
            let temp = [Card]()
            cards.append(temp)
            
            for j in 0 ..< 4 {
                let card = Card()
                cards[i].append(card)
            }
        }
        
    }
    
}


struct Card {
    var number : Int
    static var currentNumber = 0
    
    init() {
        self.number = Card.currentNumber
        Card.currentNumber += 1
    }
    
}
