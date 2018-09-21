//
//  model.swift
//  fifteenGame
//
//  Created by Admin on 21.09.2018.
//  Copyright © 2018 Admin. All rights reserved.
//

import Foundation

class Game {
    var cards = [Card]()
    
    
    
    init(numberOfCards: Int) {
        for i in 0 ... numberOfCards-1 {
            let card = Card()
            cards.append(card)
        }
    }
    
}


struct Card {
    var open = true
    var number = 0
    static var currentNumber = 0
    
    init() {
        self.number = Card.currentNumber
        Card.currentNumber += 1
    }
    
}
