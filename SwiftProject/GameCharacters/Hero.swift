//
//  Hero.swift
//  SwiftProject
//
//  Created by İsmail on 3.03.2022.
//

import Foundation

class Hero: GameCharacter {
    let weaponStrength: Float
    
    init(_ name:String, _ maxHealthPoint:Int, _ type:GameCharacterType, _ weaponStrength:Float){
        self.weaponStrength = weaponStrength
        super.init(name, maxHealthPoint, type)
    }
    
    func sneak() {
        print("\(name) successfully sneak past the obstacles.")
    }
    
    override func attack() -> Int {
        if(Int.random(in: 1...10) <= 3) {
            print("CRITICAL HIT!")
            return Int(weaponStrength * 1.2)
        }
        else{
            return Int(weaponStrength)
        }
    }
}
