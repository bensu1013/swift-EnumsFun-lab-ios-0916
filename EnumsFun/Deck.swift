//
//  Deck.swift
//  EnumsFun
//
//  Created by Michael Dippery on 8/2/16.
//  Copyright © 2016 Gamesmith, LLC. All rights reserved.
//

import Foundation

class Deck {
    var cards: [Card] = []
    
    init() {
        for suitCount in 1...4 {
            var suit: Suit = .Clubs
            switch suitCount {
            case 1:
                suit = .Clubs
            case 2:
                suit = .Diamonds
            case 3:
                suit = .Hearts
            case 4:
                suit = .Spades
            default:
                break
            }
            for rankCount in 2...14 {
                if let rank = Rank(rawValue: rankCount) {
                    cards.append(Card(rank: rank, suit: suit))
                }
            }
        }
        cards.shuffle()
    }
    
    func split() -> ([Card],[Card]) {
        return cards.split()
    }
    
}
