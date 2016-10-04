//
//  ViewController.swift
//  EnumsFun
//
//  Created by Jim Campagno on 7/20/16.
//  Copyright © 2016 Gamesmith, LLC. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var gameEngine: GameEngine
    var player1Name: String
    var player2Name: String

    
    
    @IBOutlet weak var opponentCardLabel: UILabel!
    @IBOutlet weak var playerCardLabel: UILabel!
    @IBOutlet weak var winnerLabel: UILabel!
    @IBOutlet weak var playerScoreLabel: UILabel!
    @IBOutlet weak var opponentScoreLabel: UILabel!
    @IBOutlet weak var flipCardButton: UIButton!
    
    @IBAction func flipCard(_ sender: UIButton) {
        if !gameEngine.gameOver() {
            let turn = gameEngine.playOneTurn()
            updateLabels(info: turn)
        }
        
    }
    
 
    
    required init?(coder aDecoder: NSCoder) {
        player1Name = "Me"
        player2Name = "You"
        
        gameEngine = GameEngine(player1: "Me", player2: "You")
        super.init(coder: aDecoder)
//        fatalError("init(coder:) has not been implemented")
    }
    
    func updateLabels(info: (Player, Card?, Card?)) {
        winnerLabel.text = info.0.name
        opponentCardLabel.text = info.2?.description
        playerCardLabel.text = info.1?.description
        if player1Name == info.0.name {
            print("hi")
            gameEngine.award(cards: [(info.2)!], to: gameEngine.player1)
            gameEngine.player2.lose(card: (info.2)!)
            if let curScore = Int(playerScoreLabel.text!) {
                playerScoreLabel.text = "\(curScore + 1)"
                print("hi") 
            }
        }
        if player2Name == info.0.name {
            gameEngine.award(cards: [(info.1)!], to: gameEngine.player2)
            gameEngine.player1.lose(card: (info.2)!)
            if let curScore = Int(opponentScoreLabel.text!) {
                opponentScoreLabel.text = "\(curScore + 1)"
                print("hi")
            }
        }
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}
