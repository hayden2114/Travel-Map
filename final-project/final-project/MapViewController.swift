//
//  FirstViewController.swift
//  final-project
//
//  Created by Hayden Greer on 7/16/17.
//  Copyright © 2017 Hayden Greer. All rights reserved.
//
import Foundation
import UIKit
import MapKit


class MapViewController: UIViewController, AllTheGuidesModelListenerProtocol {
    
    static let CityGuidesTableViewControllerID = "City Guides VC"
    
    var allTheGuides: AllTheGuides?

    @IBOutlet weak var mapView: MKMapView!
    
    override func viewWillAppear(_ animated: Bool) {
        print("globalModel: \(globalModel.guides)")
        allTheGuides = globalModel
        allTheGuides?.delegate = self
        reloadAnnotations(guides: (allTheGuides?.guides)!)
    }
    
    fileprivate func saveObject() {
        let sss = allTheGuides
        do {
            print("attempting to save: \(String(describing: sss))")
            try Persistence.save(sss!)
        }
        catch let nseInner as NSError {
            print("Failure: \(nseInner.localizedDescription)")
        }
    }
    
    let regionRadius: CLLocationDistance = 7000000
    func centerMapOnLocation(location: CLLocation) {
        let coordinateRegion = MKCoordinateRegionMakeWithDistance(location.coordinate,
                                                                  regionRadius * 2.0, regionRadius * 2.0)
        mapView.setRegion(coordinateRegion, animated: true)
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        allTheGuides = globalModel
        mapView.delegate = self
        mapView.mapType = .standard
        let initialLocation = CLLocation(latitude: 21.282778, longitude: -59.829444)
        centerMapOnLocation(location: initialLocation)
        navigationItem.title = "Travel Map"
        
        do {
            let mySavedObj = try Persistence.restore()
            // If object has been saved and found, won't throw
            print("Second run or later. Found the archived model.")
            if let sss = mySavedObj as? AllTheGuides {
                allTheGuides = sss
                print("success!: guides: \(sss.guides)")
            }
            else {
                print("Got the wrong type: \(type(of: mySavedObj)), giving up on restoring")
                return
            }
        }
        catch let nse as NSError {
            // First time run: nothing was saved from before
            print("Probably first run. No archived model. Error: \(nse.localizedDescription) No obj found, saving")
            saveObject()
        }

    }


    func reloadAnnotations(guides: [TravelGuide]) {
        let allAnnotations = self.mapView.annotations
        self.mapView.removeAnnotations(allAnnotations)
        
        for guide in guides {
            mapView.addAnnotation(guide)
        }
        
       
    }
    
    // MARK: AllTheGuidesModelListenerProtocol
    func itemsChanged() {
        return
    }
    
    
}



extension UIStoryboard {
    static func makeVC(_ viewControllerID: String, from: String = "Main") -> UIViewController {
        let board = UIStoryboard(name: from, bundle: nil)
        return board.instantiateViewController(withIdentifier: viewControllerID)
    }
}


extension MapViewController: MKMapViewDelegate {
    
    
    
    // Source: https://stackoverflow.com/questions/40211386/presenting-a-detail-view-controller-from-a-map-annotation-in-swift-3 and https://www.raywenderlich.com/90971/introduction-mapkit-swift-tutorial
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        if let annotation = annotation as? TravelGuide {
            let identifier = "pin"
            var view: MKPinAnnotationView
            if let dequeuedView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier)
                as? MKPinAnnotationView {
                dequeuedView.annotation = annotation
                view = dequeuedView
            } else {
                view = MKPinAnnotationView(annotation: annotation, reuseIdentifier: identifier)
                view.canShowCallout = true
                view.calloutOffset = CGPoint(x: -5, y: 5)
                view.rightCalloutAccessoryView = UIButton(type: .infoDark) as UIView
            }
            return view
        }
        return nil
    }
    
    
    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
        if control == view.rightCalloutAccessoryView {
            if let city = view.annotation?.title {
                performProgrammaticSegue(cityTitle: city!)
            }
        }
    }
    
    
    private func performProgrammaticSegue(cityTitle: String) {
        guard let cityGuidesVC = UIStoryboard.makeVC(MapViewController.CityGuidesTableViewControllerID) as? CityGuidesTableViewController else {
            return
        }
        
        let backItem = UIBarButtonItem()
        backItem.title = " "
        navigationItem.backBarButtonItem = backItem
        
        cityGuidesVC.cityGuides = (allTheGuides?.guides.filter { $0.title == cityTitle})!
        cityGuidesVC.navigationItem.title = cityTitle
        navigationController?.pushViewController(cityGuidesVC, animated: true)
    }
    
    
    
    
}





