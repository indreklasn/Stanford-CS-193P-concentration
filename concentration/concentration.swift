//
//  Concentration.swift
//  concentration
//
//  Created by Indrek Lasn on 14/02/2018.
//  Copyright © 2018 Indrek Lasn. All rights reserved.
//

import Foundation

class Concentration {
    var cards = [Card]()
    
    var indexOfOneAndOnlyFaceUpCard: Int?
    
    func chooseCard(at index: Int) {
        if !cards[index].isMatched {
            if let matchIndex = indexOfOneAndOnlyFaceUpCard, matchIndex != index {
                if cards[matchIndex].uuid == cards[index].uuid {
                    cards[matchIndex].isMatched = true
                    cards[index].isMatched = true
                }
                cards[index].isFaceUp = true
                indexOfOneAndOnlyFaceUpCard = nil
            } else {
                for flipDownIndex in cards.indices {
                    cards[flipDownIndex].isFaceUp = false
                }
                cards[index].isFaceUp = true
                indexOfOneAndOnlyFaceUpCard = index
            }
        }
    }
    
    init(numberOfPairsInCards: Int) {
        for _ in 1...numberOfPairsInCards {
            let card = Card()
            cards += [card, card]
        }
        
        for _ in 1...cards.count {
            print (cards)
        }

    }
}
