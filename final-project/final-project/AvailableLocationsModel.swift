//
//  LocationModel.swift
//  final-project
//
//  Created by Hayden  Greer on 7/24/17.
//  Copyright © 2017 Hayden Greer. All rights reserved.
//

import Foundation
import MapKit

protocol AvailableLocationsModelListenerProtocol {
    func itemsChanged() -> Void
}

class location {
    var cityCommaCountry: String
    var coordinate: CLLocationCoordinate2D
    
    init(cityCommaCountry: String, coordinate: CLLocationCoordinate2D) {
        self.cityCommaCountry = cityCommaCountry
        self.coordinate = coordinate
    }
}

class AvailableLocations {
    
    var delegate: AvailableLocationsModelListenerProtocol?
    
    var locations: [location] = [
        // USA
        location(cityCommaCountry: "New York, USA", coordinate: CLLocationCoordinate2D(latitude: 40.730610, longitude: -73.935242)),
        location(cityCommaCountry: "Boston, USA", coordinate: CLLocationCoordinate2D(latitude: 42.364506, longitude: -71.038887)),
        // Mexico
        location(cityCommaCountry: "Cabo, Mexico", coordinate: CLLocationCoordinate2D(latitude: 22.887201, longitude: -109.905038)),
        // SE Asia
        location(cityCommaCountry: "Bangkok, Thailand", coordinate: CLLocationCoordinate2D(latitude: 13.756331, longitude: 100.501765)),
        location(cityCommaCountry: "Chiang Mai, Thailand", coordinate: CLLocationCoordinate2D(latitude: 18.786626, longitude: 98.983727)),
        location(cityCommaCountry: "Pai, Thailand", coordinate: CLLocationCoordinate2D(latitude: 19.358219, longitude: 98.440486)),
        location(cityCommaCountry: "Ko Phi Phi, Thailand", coordinate: CLLocationCoordinate2D(latitude: 7.740738, longitude: 98.778410)),
        location(cityCommaCountry: "Ko Pha Ngan, Thailand", coordinate: CLLocationCoordinate2D(latitude: 9.747876, longitude: 100.023308)),
        location(cityCommaCountry: "Vientiane, Laos", coordinate: CLLocationCoordinate2D(latitude: 17.975706, longitude: 102.633104)),
        location(cityCommaCountry: "Vang Vieng, Laos", coordinate: CLLocationCoordinate2D(latitude: 18.950090, longitude: 102.443790)),
        location(cityCommaCountry: "Luang Prabang, Laos", coordinate: CLLocationCoordinate2D(latitude: 19.883903, longitude: 102.133026)),
        location(cityCommaCountry: "Siem Reap, Cambodia", coordinate: CLLocationCoordinate2D(latitude: 13.367097, longitude: 103.844813)),
        location(cityCommaCountry: "Hanoi, Vietnam", coordinate: CLLocationCoordinate2D(latitude: 21.027764, longitude: 105.834160)),
        location(cityCommaCountry: "Halong Bay, Vietnam", coordinate: CLLocationCoordinate2D(latitude: 20.957823, longitude: 107.064514)),
        location(cityCommaCountry: "Hue, Vietnam", coordinate: CLLocationCoordinate2D(latitude: 16.449800, longitude: 107.562350)),
        location(cityCommaCountry: "Hoi An, Vietnam", coordinate: CLLocationCoordinate2D(latitude: 15.880058, longitude: 108.338047)),
        location(cityCommaCountry: "Ho Chi Minh, Vietnam", coordinate: CLLocationCoordinate2D(latitude: 10.823099, longitude: 106.629664)),
        location(cityCommaCountry: "Hong Kong, China", coordinate: CLLocationCoordinate2D(latitude: 22.283835, longitude: 114.173355)),
        location(cityCommaCountry: "El Nido, Phillipines", coordinate: CLLocationCoordinate2D(latitude: 11.209709, longitude: 119.462254)),
        // Africa
        location(cityCommaCountry: "Marrakesh, Morocco", coordinate: CLLocationCoordinate2D(latitude: 31.631794, longitude: -7.989261)),
        // Europe
         location(cityCommaCountry: "Barcelona, Spain", coordinate: CLLocationCoordinate2D(latitude: 41.390205, longitude: 2.154007)),
         location(cityCommaCountry: "Interlaken, Switzerland", coordinate: CLLocationCoordinate2D(latitude: 46.686348, longitude: 7.863205)),
         location(cityCommaCountry: "Prague, Czech Republic", coordinate: CLLocationCoordinate2D(latitude: 50.075538, longitude: 14.437800)),
         location(cityCommaCountry: "Berlin, Germany", coordinate: CLLocationCoordinate2D(latitude: 52.520007, longitude: 13.404954)),
         location(cityCommaCountry: "Paris, France", coordinate: CLLocationCoordinate2D(latitude: 48.856614, longitude: 2.352222)),
         location(cityCommaCountry: "Nice, France", coordinate: CLLocationCoordinate2D(latitude: 43.710173, longitude: 7.261953)),
         location(cityCommaCountry: "Dublin, Ireland", coordinate: CLLocationCoordinate2D(latitude: 53.349805, longitude: -6.260310)),
         location(cityCommaCountry: "Budapest, Hungary", coordinate: CLLocationCoordinate2D(latitude: 47.497912, longitude: 19.040235)),
         location(cityCommaCountry: "Florence, Italy", coordinate: CLLocationCoordinate2D(latitude: 43.769560, longitude: 11.255814)),
         location(cityCommaCountry: "Amalfi Coast, Italy", coordinate: CLLocationCoordinate2D(latitude: 40.634003, longitude: 14.602681)),
         location(cityCommaCountry: "Lagos, Portugal", coordinate: CLLocationCoordinate2D(latitude: 37.102788, longitude: -8.673027)),
         location(cityCommaCountry: "Lisbon, Portugal", coordinate: CLLocationCoordinate2D(latitude: 38.722252, longitude: -9.139337)),
         location(cityCommaCountry: "Ibiza, Spain", coordinate: CLLocationCoordinate2D(latitude: 38.906914, longitude: 1.432343)),
         location(cityCommaCountry: "Munich, Germany", coordinate: CLLocationCoordinate2D(latitude: 48.135125, longitude: 11.581980)),
         location(cityCommaCountry: "Amsterdam, Netherlands", coordinate: CLLocationCoordinate2D(latitude: 52.370216, longitude: 4.895168)),
         location(cityCommaCountry: "Athens, Greece", coordinate: CLLocationCoordinate2D(latitude: 37.983810, longitude: 23.727539)),
         location(cityCommaCountry: "Santorini, Greece", coordinate: CLLocationCoordinate2D(latitude: 36.393156, longitude: 25.461509)),
         location(cityCommaCountry: "Milan, Italy", coordinate: CLLocationCoordinate2D(latitude: 45.464204, longitude: 9.189982)),
         location(cityCommaCountry: "Rome, Italy", coordinate: CLLocationCoordinate2D(latitude: 41.902783, longitude: 12.496366)),
         location(cityCommaCountry: "Sicily, Italy", coordinate: CLLocationCoordinate2D(latitude: 37.599994, longitude: 14.015356))
           ]
    
    func numLocations() -> Int {
        return locations.count
    }
}
