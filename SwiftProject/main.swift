//
//  main.swift
//  SwiftProject
//
//  Created by İsmail on 2.03.2022.
//

import Foundation

let location1 = Location(name: "Ithaca", monster: .init(name: "Monster1", health: 10, damage: 3))
let location2 = Location(name: "Sparta", monster: .init(name: "Monster2", health: 15, damage: 5))
let location3 = Location(name: "Salamis", monster: .init(name: "Monster3", health: 8, damage: 2))
let location4 = Location(name: "Mycanae", monster: .init(name: "Monster4", health: 20, damage: 1))
let location5 = Location(name: "Argos", monster: .init(name: "Monster5", health: 5, damage: 5))
let location6 = Location(name: "Athens", monster: .init(name: "Monster6", health: 50, damage: 10))

// Set Astrid's location (set this randomly)
location6.isAstridHere = true

let locations = [location1, location2, location3, location4, location5, location6]

let road1 = Road(startingLocation: location1, endingLocation: location2, roadType: .swampy)
let road2 = Road(startingLocation: location2, endingLocation: location3, roadType: .swampy)
let road3 = Road(startingLocation: location2, endingLocation: location4, roadType: .mountain)
let road4 = Road(startingLocation: location3, endingLocation: location5, roadType: .swampy)
let road5 = Road(startingLocation: location4, endingLocation: location5, roadType: .paved)
let road6 = Road(startingLocation: location5, endingLocation: location6, roadType: .swampy)

let roads = [road1, road2, road3, road4, road5, road6]

let map = Map(locations: locations, roads: roads)

print("What will you do?")
print("1. Search for Astrid")
print("2. Rescue Astrid")
print("3. Quit")
print("Enter choice:")

if let startInput = readLine() {
    if startInput == "1" {
        // Search for Astrid
        searchForAstrid(locations: locations)
    }
    else if startInput == "2" {
        // Rescue Astrid
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
    
    if let location = location {
        print("Astrid is in \(location.name)")
    }
    return location
}
