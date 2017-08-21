//
//  SecondViewController.swift
//  final-project
//
//  Created by Hayden Greer on 7/16/17.
//  Copyright © 2017 Hayden Greer. All rights reserved.
//
import Foundation
import UIKit
import MapKit

class MyTravelGuidesCell: UITableViewCell {
    
    @IBOutlet weak var title: UILabel!
    
    @IBOutlet weak var tripTitle: UILabel!
    
    @IBOutlet weak var startDate: UILabel!
    
    @IBOutlet weak var endDate: UILabel!
}


class MyTravelGuidesTableViewController: UITableViewController, AllTheGuidesModelListenerProtocol {
    
    static let CellID = "My Travel Guides Cell"
    
    static let GuideEditorVCID = "Guide Editor VC"
    
    var allTheGuides: AllTheGuides?
    
    var map: MapViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "My Travel Guides"
        allTheGuides?.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        allTheGuides = globalModel
        allTheGuides?.delegate = self
        navigationItem.title = "My Travel Guides"
        saveObject()

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
    
    
    @IBAction func addGuide(_ sender: Any) {
        performProgrammaticSegueAdd()
    }
    
    @IBOutlet var myTravelGuidesTable: UITableView!
    
    
    // MARK: AllTheGuidesModelListenerProtocol
    func itemsChanged() {
        myTravelGuidesTable.reloadData()
    }
    
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let guideModel = allTheGuides else {
            preconditionFailure("No model!")
        }
        return guideModel.numGuides()
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        return 75.0;
    }
    

     override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let guideModel = allTheGuides else {
            preconditionFailure("No model!")
        }
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "My Travel Guides Cell", for: indexPath) as? MyTravelGuidesCell
        else {
            return UITableViewCell()
        }
     
        cell.title.text = guideModel.titleAtIndex(at: indexPath.row)
        cell.tripTitle.text = guideModel.tripTitleAtIndex(at: indexPath.row)
        cell.startDate.text = guideModel.startDateAtIndex(at: indexPath.row)
        cell.endDate.text = guideModel.endDateAtIndex(at: indexPath.row)
     
     
        return cell
     }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Row \(indexPath.row) was tapped")
        performProgrammaticSegueEdit(indexPath: indexPath)
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        guard let guideModel = allTheGuides else {
            preconditionFailure("No Model!")
        }
        print("CocoaTouch informed delegate: commitEditingStyle: at row \(indexPath.row)")
        if editingStyle == .delete {
            let guideIndex = indexPath.row
            guideModel.removeGuide(index: guideIndex)
            saveObject()
        }
    }
    
    
    private func performProgrammaticSegueEdit(indexPath: IndexPath) {
        guard let guideModel = allTheGuides else {
            preconditionFailure("No model!")
        }
        guard let detailVC = UIStoryboard.makeVC(MyTravelGuidesTableViewController.GuideEditorVCID) as? GuideEditorViewController else {
            print("Cannot find the right detail editor VC!")
            return
        }
        
        
        detailVC.tripTitle = guideModel.tripTitleAtIndex(at: indexPath.row)
        detailVC.startDate = guideModel.startDateAtIndex(at: indexPath.row)
        detailVC.endDate = guideModel.endDateAtIndex(at: indexPath.row)
        detailVC.tripOverview = guideModel.tripOverviewAtIndex(at: indexPath.row)
        
        detailVC.doneButtonPressedNotifier = { (changedGuide: TravelGuide) in
            guideModel.editGuide(itemIndex: indexPath.row, changedGuide: changedGuide)
            
        }
        
        navigationController?.pushViewController(detailVC, animated: true)
    }

    
    private func performProgrammaticSegueAdd() {
        guard let guideModel = allTheGuides else {
            preconditionFailure("No model!")
        }
        guard let detailVC = UIStoryboard.makeVC(MyTravelGuidesTableViewController.GuideEditorVCID) as? GuideEditorViewController else {
            print("Cannot find the right detail editor VC!")
            return
        }
        
        detailVC.doneButtonPressedNotifier = { (newGuide: TravelGuide) in
            guideModel.addGuide(guide: newGuide)
            
        }
        
        navigationController?.pushViewController(detailVC, animated: true)
    }

}


