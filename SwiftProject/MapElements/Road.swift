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
        self.description = "startingLocation = \(startingLocation) - endingLocation = \(endingLocation) - roadType = \(roadType.rawValue)"
    }
}

enum RoadType: Int {
    case paved = 0
    case swampy = 1
    case mountain = 2
}
