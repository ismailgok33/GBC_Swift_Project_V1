//
//  GameCharacter.swift
//  SwiftProject
//
//  Created by İsmail on 2.03.2022.
//

import Foundation

class GameCharacter: CustomStringConvertible {
    let name:String
    var maxHealthPoint:Int
    let type: GameCharacterType
    let description: String
    
    init(_ name:String, _ maxHealthPoint:Int, _ type:GameCharacterType) {
        self.name = name
        self.maxHealthPoint = maxHealthPoint
        self.type = type
        description = name.uppercased()
    }
    
    func takeDamage(dmPoint:Int) {
        self.maxHealthPoint = self.maxHealthPoint - dmPoint
    }
    
    func attack() -> Int {
        return 0;
    }
}


