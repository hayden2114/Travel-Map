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
        
        location(cityCommaCountry: "New York, USA", coordinate: CLLocationCoordinate2D(latitude: 40.730610, longitude: -73.935242)),
        location(cityCommaCountry: "Boston, USA", coordinate: CLLocationCoordinate2D(latitude: 42.364506, longitude: -71.038887)),
        location(cityCommaCountry: "Cabo, Mexico", coordinate: CLLocationCoordinate2D(latitude: 22.887201, longitude: -109.905038)),
        location(cityCommaCountry: "Nassau, Bahamas", coordinate: CLLocationCoordinate2D(latitude: 25.034280, longitude: -77.396280)),
        location(cityCommaCountry: "Los Angeles, USA", coordinate: CLLocationCoordinate2D(latitude: 34.052234, longitude: -118.243685)),
        location(cityCommaCountry: "Barcelona, Spain", coordinate: CLLocationCoordinate2D(latitude: 41.390205, longitude: 2.154007)),/*
        location(cityCommaCountry: "Bangkok, Thailand", coordinate: CLLocationCoordinate2D(latitude: 13.756331, longitude: 100.501765)),
        location(cityCommaCountry: "Chiang Mai, Thailand", coordinate: CLLocationCoordinate2D(latitude: 18.786626, longitude: 98.983727)),
        location(cityCommaCountry: "Pai, Thailand", coordinate: CLLocationCoordinate2D(latitude: 19.358219, longitude: 98.440486)),
        location(cityCommaCountry: "Ko Phi Phi, Thailand", coordinate: CLLocationCoordinate2D(latitude: 7.740738, longitude: 98.778410)),
        location(cityCommaCountry: "Ko Pha Ngan, Thailand", coordinate: CLLocationCoordinate2D(latitude: 9.747876, longitude: 100.023308)),
        location(cityCommaCountry: "Vientiane, Laos", coordinate: CLLocationCoordinate2D(latitude: 17.975706, longitude: 102.633104)),
        location(cityCommaCountry: "Vang Vieng, Laos", coordinate: CLLocationCoordinate2D(latitude: 18.950090, longitude: 102.443790)),
        location(cityCommaCountry: "Luang Prabang, Laos", coordinate: CLLocationCoordinate2D(latitude: 9.747876, longitude: 100.023308)),
        location(cityCommaCountry: "Siem Reap, Cambodia", coordinate: CLLocationCoordinate2D(latitude: 13.367097, longitude: 103.844813)),
        location(cityCommaCountry: "Hanoi, Vietnam", coordinate: CLLocationCoordinate2D(latitude: 21.027764, longitude: 105.834160)),
        location(cityCommaCountry: "Halong Bay, Vietnam", coordinate: CLLocationCoordinate2D(latitude: 20.957823, longitude: 107.064514)),
        location(cityCommaCountry: "Hue, Vietnam", coordinate: CLLocationCoordinate2D(latitude: 16.449800, longitude: 107.562350)),
        location(cityCommaCountry: "Hoi An, Vietnam", coordinate: CLLocationCoordinate2D(latitude: 15.880058, longitude: 108.338047)),
        location(cityCommaCountry: "Ho Chi Minh, Vietnam", coordinate: CLLocationCoordinate2D(latitude: 10.823099, longitude: 106.629664)),
        location(cityCommaCountry: "Hong Kong, China", coordinate: CLLocationCoordinate2D(latitude: 22.283835, longitude: 114.173355)),
        location(cityCommaCountry: "El Nido, Phillipines", coordinate: CLLocationCoordinate2D(latitude: 11.209709, longitude: 119.462254)),*/
           ]
    
    func numLocations() -> Int {
        return locations.count
    }
}
