//
//  AllTheGuides.swift
//  final-project
//
//  Created by Hayden  Greer on 7/25/17.
//  Copyright © 2017 Hayden Greer. All rights reserved.
//

import Foundation
import MapKit

protocol AllTheGuidesModelListenerProtocol {
    func itemsChanged() -> Void
}

class TravelGuide: NSObject, NSCoding, MKAnnotation {
    var title: String? // This is the name of the city
    var coordinate: CLLocationCoordinate2D
    var lat: Double?
    var lon: Double?
    
    var tripTitle: String // This is the name of the trip
    var startDate: String
    var endDate: String
    var tripOverview: String // This is actually the html code diguised as a string
    
    init(title: String, coordinate: CLLocationCoordinate2D, tripTitle: String, startDate: String, endDate: String, tripOverview: String) {
        
        self.title = title
        self.coordinate = coordinate
        self.lat = coordinate.latitude
        self.lon = coordinate.longitude
        
        self.tripTitle = tripTitle
        self.startDate = startDate
        self.endDate = endDate
        self.tripOverview = tripOverview
        
        super.init()
        
    }
    
    required convenience init?(coder aDecoder: NSCoder) {
        
        guard let title = aDecoder.decodeObject(forKey: "title") as? String,
            let lat = aDecoder.decodeObject(forKey: "lat") as? Double,
            let lon = aDecoder.decodeObject(forKey: "lon") as? Double,
     
            let tripTitle = aDecoder.decodeObject(forKey: "tripTitle") as? String,
            let startDate = aDecoder.decodeObject(forKey: "startDate") as? String,
            let endDate = aDecoder.decodeObject(forKey: "endDate") as? String,
            let tripOverview = aDecoder.decodeObject(forKey: "tripOverview") as? String
                else { return nil }
        
        self.init (
            title: title,
            coordinate: CLLocationCoordinate2D(latitude: lat, longitude: lon),
            tripTitle: tripTitle,
            startDate: startDate,
            endDate: endDate,
            tripOverview: tripOverview
        )
        
        
    }
    
    // MARK: NSCoding protocol
    func encode(with aCoder: NSCoder) {
        aCoder.encode(title, forKey: "title")
        aCoder.encode(lat, forKey: "lat")
        aCoder.encode(lon, forKey: "lon")
        aCoder.encode(tripTitle, forKey: "tripTitle")
        aCoder.encode(startDate, forKey: "startDate")
        aCoder.encode(endDate, forKey: "endDate")
        aCoder.encode(tripOverview, forKey: "tripOverview")
    }
    
        
}

// My global model
var globalModel = AllTheGuides(guideModel: [TravelGuide(title: "Boston, USA", coordinate: CLLocationCoordinate2D(latitude: 42.364506, longitude: -71.038887), tripTitle: "Harvard iOS", startDate: "6/19/17", endDate: "8/04/17", tripOverview: "This is a test")])


class AllTheGuides: NSObject, NSCoding {
    
    var delegate: AllTheGuidesModelListenerProtocol?
    
    var guides = [TravelGuide]()
    
    init(guideModel: [TravelGuide]) {
        guides = guideModel
        super.init()
    }
    
    required init?(coder aDecoder: NSCoder) {
        if let guideHelper = aDecoder.decodeObject(forKey: "guides") as? [TravelGuide] {
            globalModel.guides = guideHelper
        } else {
            return nil
        }
    }
    
    // MARK: NSCoding protocol
    func encode(with aCoder: NSCoder) {
        aCoder.encode(guides, forKey: "guides")
    }
    
    func numGuides() -> Int {
        return guides.count
    }
    
    func titleAtIndex(at index: Int) -> String {
        return guides[index].title!
    }
    
    func coordAtIndex(at index: Int) -> CLLocationCoordinate2D {
        return guides[index].coordinate
    }

    
    func tripTitleAtIndex(at index: Int) -> String {
        return guides[index].tripTitle
    }
    
    
    func startDateAtIndex(at index: Int) -> String {
        return guides[index].startDate
    }
    
    func endDateAtIndex(at index: Int) -> String {
        return guides[index].endDate
    }
    
    func tripOverviewAtIndex(at index: Int) -> String {
        return guides[index].tripOverview
    }
    
    func addGuide(guide: TravelGuide) {
        guides.append(guide)
        delegate?.itemsChanged()
    }
    
    func editGuide(itemIndex: Int, changedGuide: TravelGuide) {
        guides[itemIndex] = changedGuide
        delegate?.itemsChanged()
    }
    
    func removeGuide(index: Int) {
        guides.remove(at: index)
        delegate?.itemsChanged()
    }
}

