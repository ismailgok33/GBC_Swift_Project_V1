//
//  Monster.swift
//  SwiftProject
//
//  Created by İsmail on 2.03.2022.
//

import Foundation

class Monster: GameCharacter {
    let attackPower:Int
    
    init(_ name:String, _ maxHealthPoint:Int, _ type:GameCharacterType, _ attackPower:Int){
        self.attackPower = attackPower
        super.init(name, maxHealthPoint, type)
    }
    
    override func attack() -> Int {
        if(Int.random(in: 1...10) <= 2){
            print("\(self.name) missed the attack!")
            return 0;
        }
        else{
            print("\(self.name) attacks: \(self.attackPower) damage!")
            return self.attackPower
        }
    }
}

