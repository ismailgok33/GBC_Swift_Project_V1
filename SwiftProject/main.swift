//
//  main.swift
//  SwiftProject
//
//  Created by İsmail on 2.03.2022.
//

import Foundation

print("What will you do?")
print("1. Search for Astrid")
print("2. Rescue Astrid")
print("3. Quit")

if let startInput = readLine() {
    if startInput == "1" {
        // Search for Astrid
    }
    else if startInput == "2" {
        // Rescue Astrid
    }
    else if startInput == "3" {
        print("Bye")
        exit(0)
    }
    else {
        print("Please enter a valid input to select from the menu!")
    }
}
else {
    print("Please enter a value to select from the menu!")
}
