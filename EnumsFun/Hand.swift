//
//  Hand.swift
//  EnumsFun
//
//  Created by Michael Dippery on 8/2/16.
//  Copyright © 2016 Gamesmith, LLC. All rights reserved.
//

import Foundation

class Hand {
    var cards: [Card] = []
    var size: Int {
        return cards.count
    }
    
    init(cards: [Card]) {
        self.cards = cards
    }
    
    func flip() -> Card? {
        if let card = cards.popLast() {
            return card
        }
        return nil
    }
    
    func give(card: Card) {
        cards.insert(card, at: 0)
    }
    
    func lose(card: Card) {
        for (index, it) in cards.enumerated() {
            if it.rank == card.rank {
                if it.suit == card.suit {
                    cards.remove(at: index)
                }
            }
        }
    }
    
}
