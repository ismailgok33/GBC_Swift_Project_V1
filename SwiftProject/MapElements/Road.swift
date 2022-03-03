//
//  Road.swift
//  SwiftProject
//
//  Created by İsmail on 2.03.2022.
//

import Foundation

class Road: CustomStringConvertible {
    let startingLocation: Location
    let endingLocation: Location
    let roadType: RoadType
    var description: String
    
    init(startingLocation: Location, endingLocation: Location, roadType: RoadType) {
        self.startingLocation = startingLocation
        self.endingLocation = endingLocation
        self.roadType = roadType
        self.description = ""
    }
}

enum RoadType {
    case paved
    case swampy
    case mountain
}
