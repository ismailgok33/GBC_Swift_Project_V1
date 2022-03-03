//
//  Fight.swift
//  SwiftProject
//
//  Created by İsmail on 3.03.2022.
//

import Foundation

class Fight: CustomStringConvertible {
    let monster: Monster
    let hero: Hero
    var turn: Int
    var isOver: Bool
    var description: String
    
    init(monster: Monster, hero: Hero, turn: Int, isOver: Bool) {
        self.monster = monster
        self.hero = hero
        self.turn = turn
        self.isOver = isOver
        self.description = ""
    }
    
    private func applyDamage(from: GameCharacter, to: GameCharacter) {
        
    }
    
    func performTurn(action: Actions) {
        // switch on the Actions
    }
}

enum Actions {
    case enemyAtacking
    case heroAtacking
    case heroSneaking
    case heroRunning
}
