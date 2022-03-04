//
//  Monster.swift
//  SwiftProject
//
//  Created by İsmail on 2.03.2022.
//

import Foundation

class Monster: GameCharacter, CustomStringConvertible {
    let attackPower: Int
    var description: String
    
    override init(name: String, health: Int, damage: Int) {
        self.attackPower = damage
        self.description = name.uppercased()
        super.init(name: name, health: health, damage: damage)
    }
    
//    init(monsterName: String, monsterHealth: Int, attackPower: Int) {
//        self.monsterName = monsterName
//        self.monsterHealth = monsterHealth
//        self.attackPower = attackPower
//        description = ""
//        super.init(name: monsterName, health: monsterHealth, damage: attackPower)
//    }
}
