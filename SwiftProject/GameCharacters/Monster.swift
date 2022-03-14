//
//  Monster.swift
//  SwiftProject
//
//  Created by İsmail on 2.03.2022.
//

import Foundation

class Monster: GameCharacter, CustomStringConvertible {
    let attackPower: Double
    var description: String
    
    override init(name: String, health: Double, damage: Double) {
        self.attackPower = damage
        self.description = name.uppercased()
        super.init(name: name, health: health, damage: damage)
    }
    
}
