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
    //? how do this simple?
    func shuffleCards() { // make [][] -> [] and shuffle
        var a = cards.flatMap { array  in
            return array
        }
        a.shuffle()
        
        var k = 0
        for i in cards.indices { // rewrite [][]cards from shuffled []
            for j in cards[i].indices {
                cards[i][j] = a[k]
                k += 1
            }
        }
   
    }
    
    
    init(numberOfCards: Int) { //only 16 const
        Card.currentNumber = 0
        
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

//Mark: - delete after update swift 4.2 ??
extension MutableCollection {
    /// Shuffles the contents of this collection.
    mutating func shuffle() {
        let c = count
        guard c > 1 else { return }
        
        for (firstUnshuffled, unshuffledCount) in zip(indices, stride(from: c, to: 1, by: -1)) {
            // Change `Int` in the next line to `IndexDistance` in < Swift 4.1
            let d: Int = numericCast(arc4random_uniform(numericCast(unshuffledCount)))
            let i = index(firstUnshuffled, offsetBy: d)
            swapAt(firstUnshuffled, i)
        }
    }
}

extension Sequence {
    /// Returns an array with the contents of this sequence, shuffled.
    func shuffled() -> [Element] {
        var result = Array(self)
        result.shuffle()
        return result
    }
}


