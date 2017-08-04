//
//  problem4.swift
//  final-project
//
//  Created by Hayden Greer on 7/16/17.
//  Copyright © 2017 Hayden Greer. All rights reserved.
//

import Foundation


/*
 
 Data Model: *** Need some help with this one. When a user creates a guide I want them to input the location in the form of city name vs. coordinates. This is so if there are two guides for the city name "Boston", they will have the exact same coordinates." ***
 
    CitiesWithGuide -
        1) Contains all the cities where a travel guide has been created
            1.1) Array of location struct objects.
                1.1.1) location struct will have a city name, country name, and coordinate.
 
    AllTheGuides -
        1) Contains all the travel guides that have been created
            1.1) Array of TravelGuide struct objects
 
    TravelGuide -
        1) Contains all the details of a travel guide
            1.1) location
                1.1.1) city name
                1.1.2) country name
                1.1.3) coordinate
            1.2) Title
                1.2.1) User can attach a title/name to the guide
            1.3) Time period spent in the city
                1.3.1) start date - end date
            1.4) Share your experience!
                1.4.1) Text view - attributed text
 
 
 Types:
 
 1) Location (struct)    **** look into MapKit Placemark, Core Location, and GeoCoding for handling this ***
    1.1) City, Country
    1.2) Coordinate
 
 
 2) TravelGuide (Struct)
    2.1) Location (struct)
    2.2) title (String)
    2.3) Start date (date)
    2.4) End date (date)
    2.5) description (NSAttributedString) 
 
 3) AllTheGuides (class)
    3.1) Array of TravelGuide structs
 
 
 Notes from Alex:
    MapSearchAPI or prepopulate a list of cities with coordinates
    NSAttributed String will be a lot of trouble to store. Think about creating multiple input fields (String) and using a scroll view
 
 Option 1:
    - User can choose from a prepopulated list of cities that will appear in a picker view
    - Each city in picker view will have the proper coordinate associated with it
 
 Option 2:
    - User will choose location via search bar
    - I will use the MKlocalsearch API, convert that search request using a forward CLGeocoder to obtain the coordinates, and then use the placemark it returns to create the city and coordinates.
 
*/
