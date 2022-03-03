//
//  Location.swift
//  SwiftProject
//
//  Created by İsmail on 2.03.2022.
//

import Foundation

class Location: CustomStringConvertible {
    let name: String
    let monster: Monster
    var description: String
    
    init(name: String, monster: Monster) {
        self.name = name
        self.monster = monster
        description = ""
    }
}
