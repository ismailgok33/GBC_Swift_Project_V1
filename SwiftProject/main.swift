//
//  main.swift
//  SwiftProject
//
//  Created by İsmail on 2.03.2022.
//

import Foundation

// Initialize locations, roads and map
var locations = initLocations()
var roads = initRoads(locations: locations)
var map = Map(roads: roads)

// Set Astrid's and Hero's locations
var (heroLocation, astridLocation) = setHeroAndAstridLocations(heroIndex: 0, astridIndex: locations.count - 1)

// global variables for state management
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
            
            print("------------------------------")
        }
        else if startInput == "2" {
            // Rescue Astrid
            if isRescueCompleted {
                print("You have already rescued Astrid.")
                continue
            }
            
            if !isSearchCompleted {
                print("First, you have to search for Astrid.")
                continue
            }
            
            
            print("Starting quest")
            print("Generating the easiest path to Astrid...")
            
            let path = map.generatePath(startingLocation: heroLocation, endingLocation: astridLocation)
            print("Path found. The easiest path to Astrid is: \(path)")
            
            print("------------------------------")
            
            // TODO:  Call Fight function here
            var winner: GameCharacter?
            let hero = Hero("Hugie", 100, .HERO, 20.0)
            let maxHeroHp = hero.maxHealthPoint
            for node in path {
                let currentLocation = node
                print("ARRIVED AT \(currentLocation).")
                let fight = Fight(hero, currentLocation.monster)
                fight.maxHeroHP = maxHeroHp
                winner = fight.fightBegin()
                
                if winner! === currentLocation.monster {
                    print("GAME OVER!")
                    isRescueCompleted = false
                    
                    // Reset the reference types
                    locations = initLocations()
                    roads = initRoads(locations: locations)
                    map = Map(roads: roads)
                    (heroLocation, astridLocation) = setHeroAndAstridLocations(heroIndex: 0, astridIndex: locations.count - 1)
                    
                    break
                }
            }
            
            if winner! === hero {
                print("You rescued Astrid! Congratulations!")
                isRescueCompleted = true
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

// Search for Astrid
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

// Initialize the locations manually
func initLocations() -> [Location] {
    let location1 = Location(name: "Ithaca", monster: .init("The_Rainbow_Mutant", 20, .MONSTER, 10))
    let location2 = Location(name: "Sparta", monster: .init("The_Crying_Doll", 25, .MONSTER, 12))
    let location3 = Location(name: "Mycanae", monster: .init("The_Icy_Snake", 30, .MONSTER, 14))
    let location4 = Location(name: "Argos", monster: .init("The_Night_Worm", 33, .MONSTER, 16))
    let location5 = Location(name: "Athens", monster: .init("The_Nemean_Lion", 35, .MONSTER, 18))
    
    return [location1, location2, location3, location4, location5]
}

// Initialize the roads manually
func initRoads(locations: [Location]) -> [Road] {
    let road1 = Road(startingLocation: locations[0], endingLocation: locations[1], roadType: .mountain)
    let road2 = Road(startingLocation: locations[1], endingLocation: locations[2], roadType: .swampy)
    let road3 = Road(startingLocation: locations[1], endingLocation: locations[3], roadType: .paved)
    let road4 = Road(startingLocation: locations[2], endingLocation: locations[4], roadType: .paved)
    let road5 = Road(startingLocation: locations[3], endingLocation: locations[4], roadType: .mountain)
    
    return [road1, road2, road3, road4, road5]
}

// Set the locations of Hero and Astrid manually
func setHeroAndAstridLocations(heroIndex: Int, astridIndex: Int) -> (Location, Location) {
    locations[heroIndex].isHeroHere = true
    locations[astridIndex].isAstridHere = true
    
    return (locations[heroIndex], locations[astridIndex])
}

