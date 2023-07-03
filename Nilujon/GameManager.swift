//
//  GameManager.swift
//  Nilujon
//
//  Created by second_admin on 23/06/23.
//

import Foundation

class GameManager {
    var guessingNumber: Int
    var score: Int
    var round: Int
    let maxRound: Int = 20
    
    init() {
        self.guessingNumber = Int.random(in: 1...100)
        self.score = 0
        self.round = 1
        
    }
        
        func nextRound () {
            round = round + 1
            guessingNumber = Int.random(in: 1...100)
        }
    
    func startNewGame() {
        self.guessingNumber = Int.random(in: 1...100)
        self.score = 0
        self.round = 1
    }

}
