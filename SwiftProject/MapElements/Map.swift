//
//  Map.swift
//  SwiftProject
//
//  Created by İsmail on 2.03.2022.
//

import Foundation

class Map: CustomStringConvertible {
    let locations: [Location]?
    let roads: [Road]?
    var description: String
    
    init(locations: [Location], roads: [Road]) {
        self.locations = locations
        self.roads = roads
        description = "locations = \(locations) - roads = \(roads)"
    }   
    
}
