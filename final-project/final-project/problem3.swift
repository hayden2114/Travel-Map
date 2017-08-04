//
//  problem3.swift
//  final-project
//
//  Created by Hayden Greer on 7/16/17.
//  Copyright © 2017 Hayden Greer. All rights reserved.
//

import Foundation

/*
 
 Navigation:
    UITabViewController -
        1) tab for "map"
        2) tab for "my travel guides"
    UINavigationController -
        1) Navigate from the map -> list of travel guides for selected city -> travel guide viewer.
        2) Navigate from "my travel guides" -> travel guide editor view
    Custom segues -
        1) When user clicks on pin and then clicks the annotation button. Programmatic Segue in place
        2) When user clicks on a cell in "my travel guides", a programmatic segue will take place. Not incorporated into storyboard yet. Only the "+" button segue is incorporated.
 
 Persistance:
    1) Store travel guides that are created
        1.1) Web storage and persistance across multiple devices if multiple users is feasible
        1.2) Local persitance (NSCoder?) of travel guides is needed regardless
 
 Background tasks off the main thread:
    The only background task I can think of is updating the world map with new travel guides created by other users.
 
 Custom Views or images:
    Custom view will be my world map view with tap-able pins. This view will be browsable and zoomable while displaying the necessary pins inside the view. Once user taps a pin, the annotaion will be a custom view with the city, country and a custom button (not the default "i")
 
 
 */
