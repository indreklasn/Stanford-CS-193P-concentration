//
//  Card.swift
//  concentration
//
//  Created by Indrek Lasn on 14/02/2018.
//  Copyright © 2018 Indrek Lasn. All rights reserved.
//

import Foundation

struct Card {

    var isFaceUp: Bool = false
    var isMatched: Bool = false
    var uuid: Int
    
    static var uuid = 0
    static func getUuid() -> Int {
        uuid += 1
        return uuid;
    }
    
    init() {
        self.uuid = Card.getUuid()
    }
}
