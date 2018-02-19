//
//  ViewController.swift
//  concentration
//
//  Created by Indrek Lasn on 13/02/2018.
//  Copyright © 2018 Indrek Lasn. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    lazy var game = Concentration(numberOfPairsInCards: (cardButtons.count + 1) / 2)

    var flapCounter = 0 {
        didSet {
            flapLabel.text = "Flips: \(flapCounter)"
        }
    }
    
    @IBOutlet weak var flapLabel: UILabel!
    @IBOutlet var cardButtons: [UIButton]!
    
    
    @IBAction func fireUpNewGame(_ sender: UIButton) {
        
    }
    
    @IBAction func touchCard(_ sender: UIButton) {
        flapCounter += 1;
        if let cardNumber = cardButtons.index(of: sender) {
            game.chooseCard(at: cardNumber)
            updateViewFromModel()
        } else {
            print("chosen button was not in the cardButtons")
        }
        
    }
    
    func updateViewFromModel() {
        for index in cardButtons.indices {
            let button = cardButtons[index]
            let card = game.cards[index]
            
            if card.isFaceUp {
                button.setTitle(emoji(for: card), for: UIControlState.normal)
                button.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
            } else {
                button.setTitle("", for: UIControlState.normal)
                button.backgroundColor = card.isMatched ? #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0) : #colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1)
            }
        }
    }
    
    var emojiChoices = ["👻", "🎃", "🇺🇸", "🥋", "🌗", "🥑"]
    var emoji = [Int:String]()
    
    
    func emoji(for card: Card) -> String {
        
        if emoji[card.uuid] == nil, emojiChoices.count > 0 {
            let randomIndex = Int(arc4random_uniform(UInt32(emojiChoices.count)))
            emoji[card.uuid] = emojiChoices.remove(at: randomIndex)
        }
        
        return emoji[card.uuid] ?? "?"
    }
    
}

