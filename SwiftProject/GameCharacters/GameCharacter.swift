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
    
    init(_ name:String, _ maxHealthPoint:Int, _ type:GameCharacterType) {
        self.name = name
        self.maxHealthPoint = maxHealthPoint
        self.type = type
    }
    
    func takeDamage(dmPoint:Int) {
        self.maxHealthPoint = self.maxHealthPoint - dmPoint
    }
    
    func attack() -> Int {
        return 0;
    }
}

extension GameCharacter {
    var description: String {
        get {
            return "The name of the \(type) is \(name) and max health point of \(name) is \(maxHealthPoint)."
        }
    }
}

