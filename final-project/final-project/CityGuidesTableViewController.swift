//
//  CityGuidesTableViewController.swift
//  final-project
//
//  Created by Hayden Greer on 7/16/17.
//  Copyright © 2017 Hayden Greer. All rights reserved.
//
import Foundation
import UIKit

class CityGuidesCell: UITableViewCell {
    
    @IBOutlet weak var tripTitle: UILabel!
    
    @IBOutlet weak var startDate: UILabel!
    
    @IBOutlet weak var endDate: UILabel!
    
}

extension Array where Element:TravelGuide {
    func startDateAtIndex(at index: Int) -> String {
        return self[index].startDate
    }
    
    func endDateAtIndex(at index: Int) -> String {
        return self[index].endDate
    }
    
    func tripOverviewAtIndex(at index: Int) -> String {
        return self[index].tripOverview
    }
    
}



class CityGuidesTableViewController: UITableViewController, AllTheGuidesModelListenerProtocol {
    
    static let CellID = "City Guides Cell"
    
    static let GuideViewerViewControllerID = "Guide Viewer VC"
    
    var cityGuides = [TravelGuide]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBOutlet var cityGuidesTable: UITableView!
    
    // MARK: - AllTheGuidesModelListenerProtocol
    func itemsChanged() {
        cityGuidesTable.reloadData()
    }

    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cityGuides.count
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        return 60.0;
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "City Guides Cell", for: indexPath) as? CityGuidesCell
        else {
            return UITableViewCell()
        }

        cell.tripTitle.text = cityGuides[indexPath.row].tripTitle
        cell.startDate.text = cityGuides[indexPath.row].startDate
        cell.endDate.text = cityGuides[indexPath.row].endDate

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performProgrammaticSegueView(indexPath: indexPath)
    }
    
    
    private func performProgrammaticSegueView(indexPath: IndexPath) {
        guard let guideViewerVC = UIStoryboard.makeVC(CityGuidesTableViewController.GuideViewerViewControllerID) as? GuideViewerViewController else {
            return
        }
        
        let backItem = UIBarButtonItem()
        backItem.title = " "
        navigationItem.backBarButtonItem = backItem
        guideViewerVC.navigationItem.title = cityGuides[indexPath.row].tripTitle
        
        guideViewerVC.startDate = cityGuides.startDateAtIndex(at: indexPath.row)
        guideViewerVC.endDate = cityGuides.endDateAtIndex(at: indexPath.row)
        guideViewerVC.tripOverview = cityGuides.tripOverviewAtIndex(at: indexPath.row)
        
        navigationController?.pushViewController(guideViewerVC, animated: true)
    }
    

}
