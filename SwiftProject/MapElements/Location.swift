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
    var isAstridHere: Bool = false
    var isHeroHere: Bool = false
//    let level: Int
    
    init(name: String, monster: Monster) {
        self.name = name
        self.monster = monster
//        self.level = level
        description = name.uppercased()
    }
}


extension Location: Hashable {
    
    static func == (lhs: Location, rhs: Location) -> Bool {
        return lhs.name == rhs.name
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(name)
    }
    
}
