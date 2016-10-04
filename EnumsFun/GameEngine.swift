//
//  GameEngine.swift
//  EnumsFun
//
//  Created by Michael Dippery on 8/2/16.
//  Copyright © 2016 Gamesmith, LLC. All rights reserved.
//

import Foundation

class GameEngine {
    
    var player1: Player
    var player2: Player
    var deck: Deck
    
    init(player1: String, player2: String) {
        self.deck = Deck()
        let splitDeck = deck.split()
        self.player1 = Player(name: player1, hand: Hand(cards: splitDeck.0))
        self.player2 = Player(name: player2, hand: Hand(cards: splitDeck.1))
    }
    
    func playOneTurn() -> (Player, Card?, Card?) {
        if let card1 = player1.flip() {
            if let card2 = player2.flip() {
                if card1.rank.rawValue > card2.rank.rawValue {
                    return (player1, card1, card2)
                } else {
                    return (player2, card1, card2)
                }
            } else {
                return (player1, nil, nil)
            }
        } else {
            return (player2, nil, nil)
        }
        
    }
    
    func award(cards: [Card], to player: Player) {
        for card in cards {
            player.give(card: card)
        }
    }
    
    func gameOver() -> Bool {
        if player1.hand.cards.isEmpty || player2.hand.cards.isEmpty {
            return true
        }
        return false
    }
    
}
