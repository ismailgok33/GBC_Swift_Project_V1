//
//  Hero.swift
//  SwiftProject
//
//  Created by İsmail on 3.03.2022.
//

import Foundation

class Hero: GameCharacter, CustomStringConvertible {
    let weaponStrength: Int
    var description: String
    
    override init(name: String, health: Int, damage: Int) {
        self.weaponStrength = damage
        self.description = ""
        super.init(name: name, health: health, damage: damage)
    }
    
    func sneak() {
        // pass obstacles
    }
}
