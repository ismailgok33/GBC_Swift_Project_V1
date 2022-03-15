//
//  main.swift
//  SwiftProject
//
//  Created by İsmail on 2.03.2022.
//

import Foundation

// Initialize locations, roads and map
let locations = initLocations()
let roads = initRoads(locations: locations)
let map = Map(roads: roads)

// Set Astrid's and Hero's location (set this randomly)
locations[locations.count - 1].isAstridHere = true
locations[0].isHeroHere = true
let heroLocation = locations.first!
let astridLocation = locations.last!

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

                print("ARRIVED AT \(node).")
                print("\(node.monster) IS WAITING TO FIGHT!")
                print("FIGHT BEGINS")
                
//                let fight = Fight(&hero, node.monster)
                let fight = Fight(hero, node.monster)
                fight.maxHeroHP = maxHeroHp
                winner = fight.fightBegin()
                
                if winner! === node.monster {
                    print("GAME OVER!")
                    isRescueCompleted = false
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

func initLocations() -> [Location] {
    let location1 = Location(name: "Ithaca", monster: .init("Monster1", 10, .MONSTER, 10))
    let location2 = Location(name: "Sparta", monster: .init("Monster2", 20, .MONSTER, 15))
    let location3 = Location(name: "Mycanae", monster: .init("Monster3", 30, .MONSTER, 20))
    let location4 = Location(name: "Argos", monster: .init("Monster4", 40, .MONSTER, 25))
    let location5 = Location(name: "Athens", monster: .init("Monster5", 50, .MONSTER, 30))
    
    return [location1, location2, location3, location4, location5]
}

func initRoads(locations: [Location]) -> [Road] {
    let road1 = Road(startingLocation: locations[0], endingLocation: locations[1], roadType: .mountain)
    let road2 = Road(startingLocation: locations[1], endingLocation: locations[2], roadType: .swampy)
    let road3 = Road(startingLocation: locations[1], endingLocation: locations[3], roadType: .paved)
    let road4 = Road(startingLocation: locations[2], endingLocation: locations[4], roadType: .paved)
    let road5 = Road(startingLocation: locations[3], endingLocation: locations[4], roadType: .mountain)
    
    return [road1, road2, road3, road4, road5]
}

