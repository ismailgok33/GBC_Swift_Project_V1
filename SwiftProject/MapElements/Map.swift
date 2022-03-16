//
//  NewMap.swift
//  SwiftProject
//
//  Created by İsmail on 13.03.2022.
//

import Foundation

class Map {
    var adjacencyList:[Location:[(destination:Location, price:RoadType)]] = [:]
    
    init(roads: [Road]) {
        for road in roads {
            let srcValue = road.startingLocation // key
            let tupleToAdd = (road.endingLocation, road.roadType) // value
            
            adjacencyList[srcValue, default: []].append(tupleToAdd)
        }
    }
    
    func generatePath(startingLocation: Location, endingLocation: Location) -> [Location] {
        var currentLocation = startingLocation
        var result = [currentLocation]
        
        while currentLocation != endingLocation {
            if let neighborList = adjacencyList[currentLocation] {
                var nextLocation = neighborList.first!.destination
                var easiestRoad = neighborList.first!.price
                
                for neighbor in neighborList {
                    if neighbor.price.rawValue < easiestRoad.rawValue {
                        easiestRoad = neighbor.price
                        nextLocation = neighbor.destination
                    }
                }
                
                currentLocation = nextLocation
                print("The next location to visit is: \(currentLocation)")
                result.append(currentLocation)
                
            }
            else {
                // there is no neighbor to visit
                print("There is no neighbor to visit")
                
            }
        }
        
        return result
    }
    
    
}
