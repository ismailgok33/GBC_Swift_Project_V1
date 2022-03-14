//
//  GameCharacter.swift
//  SwiftProject
//
//  Created by İsmail on 2.03.2022.
//

import Foundation

class GameCharacter {
    let name: String
    var health: Double
    let damage: Double
    
    init(name: String, health: Double, damage: Double) {
        self.name = name
        self.health = health
        self.damage = damage
    }
    
    func takeDamage(amount: Double) {
        health -= amount
    }
    
    func attack() -> Double {
        return damage
    }
}
