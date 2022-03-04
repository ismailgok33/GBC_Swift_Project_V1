//
//  main.swift
//  SwiftProject
//
//  Created by İsmail on 2.03.2022.
//

import Foundation

let location1 = Location(name: "Ithaca", monster: .init(name: "Monster1", health: 10, damage: 3), level: 0)
let location2 = Location(name: "Sparta", monster: .init(name: "Monster2", health: 15, damage: 5), level: 1)
let location3 = Location(name: "Salamis", monster: .init(name: "Monster3", health: 8, damage: 2), level: 2)
let location4 = Location(name: "Mycanae", monster: .init(name: "Monster4", health: 20, damage: 1), level: 2)
let location5 = Location(name: "Argos", monster: .init(name: "Monster5", health: 5, damage: 5), level: 3)
let location6 = Location(name: "Athens", monster: .init(name: "Monster6", health: 50, damage: 10), level: 4)

// Set Astrid's and Hero's location (set this randomly)
location6.isAstridHere = true
location1.isHeroHere = true

let locations = [location1, location2, location3, location4, location5, location6]

let road1 = Road(startingLocation: location1, endingLocation: location2, roadType: .swampy)
let road2 = Road(startingLocation: location2, endingLocation: location3, roadType: .swampy)
let road3 = Road(startingLocation: location2, endingLocation: location4, roadType: .mountain)
let road4 = Road(startingLocation: location3, endingLocation: location5, roadType: .swampy)
let road5 = Road(startingLocation: location4, endingLocation: location5, roadType: .paved)
let road6 = Road(startingLocation: location5, endingLocation: location6, roadType: .swampy)

let roads = [road1, road2, road3, road4, road5, road6]

let map = Map(locations: locations, roads: roads)

var isSearchCompleted = false
var isRescueCompleted = false

while true {

    if let startInput = askForInput(isSearchCompleted: isSearchCompleted, isRescueCompleted: isRescueCompleted) {
        if startInput == "1" {
            // Search for Astrid
            if isSearchCompleted {
                print("You have already searched for Astrid.")
                continue
            }
            
            if let location = searchForAstrid(locations: locations) {
                print("Astrid is in \(location.name)")
                isSearchCompleted = true
            }
            else {
                print("Astrid is not on the map.")
            }
        }
        else if startInput == "2" {
            // Rescue Astrid
            print("Starting quest")
            print("Generating the easiest path to Astrid...")
            if let path = generatePath(map: map) {
                print("Path found. The easiest path to Astrid is: \(path)")
                print("ARRIVED AT \(path[0]).")
                print("\(path[0].monster) IS WAITING TO FIGHT!")
                print("FIGHT BEGINS")
                
                // Call Fight function here
            }
            else {
                print("Path could not be found!")
            }
            
            
        }
        else if startInput == "3" {
            print("Bye")
            exit(0)
        }
        else {
            print("Invalid selection, try again.")
        }
    }
    else {
        print("Invalid selection, try again.")
    }
}

// Shows the main menu and gets a user input
func askForInput(isSearchCompleted: Bool, isRescueCompleted: Bool) -> String? {
    print("\n What will you do?")
    if isSearchCompleted {
        print("1. Search for Astrid [COMPLETED!]")
    }
    else {
        print("1. Search for Astrid")
    }
    if isRescueCompleted {
        print("2. Rescue Astrid [COMPLETED!]")
    }
    else {
        print("2. Rescue Astrid")
    }
    print("3. Quit")
    print("Enter choice:")
    
    return readLine()
}

// Searches for Astrid
func searchForAstrid(locations: [Location]) -> Location? {
    var location: Location?
    for loc in locations {
        if !loc.isAstridHere {
            print("Searching \(loc.name): Astrid not found, moving to next city.")
        }
        else {
            print("Searching \(loc.name): Astrid found!")
            location = loc
        }
    }
    
    return location
}

// Generate path
func generatePath(map: Map) -> [Location]? {
    var result = [Location]()
    
    guard let roads = map.roads else { return nil }
    guard let locations = map.locations else { return nil }
     
    let heroLocation = locations.first { $0.isHeroHere } // find the location having Hero
    let astridLocation = locations.first { $0.isAstridHere }  // find the location having Astrid
    
    guard let heroLocation = heroLocation, let astridLocation = astridLocation else { return nil }
    
    result.append(heroLocation)

    print("HeroLocation = \(heroLocation)")
    // find the first road from Hero
    let startRoads = roads.filter({ $0.startingLocation.name.lowercased() == heroLocation.name.lowercased() })
    
    var bestRoad = startRoads[0]
    if startRoads.count > 1 {
        bestRoad = startRoads.filter({ $0.roadType == .paved}).first ?? startRoads.filter({ $0.roadType == .swampy }).first!
    }
    
    var nextLocation: Location? = bestRoad.endingLocation
    
    while nextLocation !== nil {
        result.append(nextLocation!)
        
        if nextLocation?.name.lowercased() == astridLocation.name.lowercased() {
            // found Astrid
            result.append(astridLocation)
            break
        }
        
        let nextRoads = roads.filter({ $0.startingLocation.name.lowercased() == nextLocation!.name.lowercased() })
        bestRoad = nextRoads[0]
        if nextRoads.count > 1 {
            bestRoad = nextRoads.filter({ road in
                if road.endingLocation.name.lowercased() == astridLocation.name.lowercased() {
                    return true
                }
                else if road.roadType == .paved {
                    return true
                }
                return false
            }).first ?? nextRoads.filter({ $0.roadType == .swampy }).first!
//            bestRoad = nextRoads.filter({ $0.roadType == .paved}).first ?? nextRoads.filter({ $0.roadType == .swampy }).first!
        }
        nextLocation = bestRoad.endingLocation
    }
    
    return result
}
