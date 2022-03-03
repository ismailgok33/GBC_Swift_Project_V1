//
//  GameCharacter.swift
//  SwiftProject
//
//  Created by İsmail on 2.03.2022.
//

import Foundation

class GameCharacter {
    let name: String
    var health: Int
    let damage: Int
    
    init(name: String, health: Int, damage: Int) {
        self.name = name
        self.health = health
        self.damage = damage
    }
    
    func takeDamage(amount: Int) {
        health -= amount
    }
    
    func attack() -> Int {
        return damage
    }
}
