//
//  problem1.swift
//  final-project
//
//  Created by Hayden Greer on 7/16/17.
//  Copyright © 2017 Hayden Greer. All rights reserved.
//

import Foundation

/*
 
 a) What is the app:
 
    Create travel guides and post them onto a world map
 
 b) Functional scope:
 
    The browsable, zoomable world map will display city-specific travel guides represented as pins. If a guide has been uploaded for a certain city, a pin will be present on the map for that city. Click a pin to open a city and then select from a list of the guides for that city.
 
 c) What makes it useful:
 
    People who travel to a new city can access personal guides from fellow travelers who have already visited and experienced the city.
 
 d) Project features for this assignment:
 
    1) User login (Facebook?)  *** Not incorporated into storyboard. Check message at the bottom of this page***
    2) Browsable world map - tab 1
        2.1) World map displays pins that denote a travel guide has been created for the city
        2.2) User clicks on a pin -> user clicks on map annoation button -> segue's to a table view that displays the list of travel guides created for the respective city.
            2.2.1) Table cell will display creator of the guide and time period spent in the city.
        2.3) User clicks on a travel guide -> segue's to guide viewer
            2.3.1) Displays all the travel guide info
    3) My travel guides - tab 2
        3.1) Table view with all your own travel guides
        3.2) Plus button that enables creation of a travel guide -> segue to travel guide editor
        3.2) Slide to delete travel guide
        3.3) Tap to view/edit travel guide -> segue to travel guide editor
            3.3.2) Displays travel guide info
            3.3.1) Ability to edit each field
 
 
 e) Full Project feature scope:
 
    1) User login (Facebook + email)
    2) Browsable world map - tab 1
        2.1) World map displays (public) pins that denote a travel guide has been created for the city
        2.2) User clicks on a pin -> user clicks on map annoation button -> segue's to a table view that displays the list of travel guides created for the respective city.
            2.2.1) Table cell will display picture, creator of guide, time period spent in the city, and and number of "upvotes".
            2.2.2) Organized by upvotes. Most upvotes at the top of the list.
        2.3) User clicks on a travel guide -> segue's to guide viewer
            2.3.1) Displays all the travel guide info
            2.3.2) Ability to comment on the travel guide
            2.3.3) Ability to upvote travel guide.
            2.3.4) Ability to share the travel guide (email, Facebook, etc.)
    3) My travel guides - tab 2
        3.1) Table view with all your own travel guides
            3.1.1) Section for each city and each section organized by time of creation
            3.1.2) Searchable
        3.2) Plus button that enables creation of a travel guide ->  segue to travel guide editor
            3.2.1) Toggle to private to make the guide invisible on the map
        3.2) Slide to delete travel guide
        3.3) Tap to view/edit travel guide -> segue to travel guide editor
            3.3.1) Displays travel guide info
            3.3.2) Ability to edit each field
 
 
If it is feasible, I'd really like to incorporate user login because this app is useful only if multiple people can use it. However, please inform me if building this app to handle multiple users will be too difficult for this projects time restraint. I have no way to judge how difficult it is since we haven't covered that in lecture.
 
 Also, I believe the structure of scope d would allow me to expand the app to scope e with very little re-writing of code, if any. Let me know if you agree!
 
 */
