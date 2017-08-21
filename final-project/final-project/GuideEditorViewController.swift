//
//  GuideEditorViewController.swift
//  final-project
//
//  Created by Hayden Greer on 7/16/17.
//  Copyright © 2017 Hayden Greer. All rights reserved.
//
import Foundation
import UIKit
import RichEditorView

extension UIViewController { // Source: https://stackoverflow.com/questions/38741556/ios-how-to-simple-return-back-to-previous-presented-pushed-view-controller-progr
    func performSegueToReturnBack()  {
        if let nav = self.navigationController {
            nav.popViewController(animated: true)
        } else {
            self.dismiss(animated: true, completion: nil)
        }
    }
}

extension GuideEditorViewController: RichEditorDelegate {
    
    func richEditor(_ editor: RichEditorView, contentDidChange content: String) {
        if content.isEmpty {
            htmlTextView.text = "HTML Preview"
        } else {
            htmlTextView.text = content
        }
    }
    
}

class GuideEditorViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, AvailableLocationsModelListenerProtocol {
    
    var availableLocations = AvailableLocations()
    
    var pickerData = [location]()
    
    var doneButtonPressedNotifier: ((TravelGuide) -> Void)?
    
    var startDate: String?
    var endDate: String?
    var tripTitle: String?
    var tripOverview: String = ""
    
    lazy var toolbar: RichEditorToolbar = {
        let toolbar = RichEditorToolbar(frame: CGRect(x: 0, y: 0, width: self.view.bounds.width, height: 44))
        toolbar.options = RichEditorDefaultOption.all
        return toolbar
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tripOverviewField.delegate = self
        tripOverviewField.inputAccessoryView = toolbar
        
        toolbar.delegate = self as? RichEditorToolbarDelegate
        toolbar.editor = tripOverviewField

        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(self.handleAction(_:)))
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        availableLocations.delegate = self
        pickerData = availableLocations.locations
        self.itemsChanged()
    }
    

    
    @IBOutlet weak var cityPicker: UIPickerView! {
        didSet {
            self.cityPicker.delegate = self
            self.cityPicker.dataSource = self
        }
    }
    
    @IBOutlet weak var startDateField: UITextField! {
        didSet {
            startDateField.text = startDate
        }
    }
    @IBOutlet weak var endDateField: UITextField! {
        didSet {
            endDateField.text = endDate
        }
    }
    @IBOutlet weak var tripTitleField: UITextField! {
        didSet {
            tripTitleField.text = tripTitle
        }
    }
    
   
    
    @IBOutlet var tripOverviewField: RichEditorView! {
        didSet {
            tripOverviewField.html = tripOverview
        }
    }

    
    @IBOutlet var htmlTextView: UITextView!


    func handleAction(_ sender: AnyObject) {
        let cityIndex = cityPicker.selectedRow(inComponent: 0)
        let city = pickerData[cityIndex]
        tripOverviewField.html = htmlTextView.text
        if cityIndex == 0 {
            let alertController = UIAlertController(title: "Is New York the correct city?", message: "Just making sure😁", preferredStyle: UIAlertControllerStyle.alert)
            
            let okAction = UIAlertAction(title: "Yes, it is", style: UIAlertActionStyle.default)
            {
                (result : UIAlertAction) -> Void in
                print("You pressed Yes, it is")
                if self.tripTitleField.text == "" || self.startDateField.text == "" || self.endDateField.text == "" {
                    return
                } else {
                    self.doneButtonPressedNotifier?(TravelGuide(title: city.cityCommaCountry, coordinate: city.coordinate, tripTitle: self.tripTitleField.text!, startDate: self.startDateField.text!, endDate: self.endDateField.text!, tripOverview: self.tripOverviewField.html))
                }

                self.performSegueToReturnBack()
            }
            let cancelAction = UIAlertAction(title: "Nope", style: UIAlertActionStyle.destructive)
            {
                (result : UIAlertAction) -> Void in
                print("You pressed Nope")
            }
            alertController.addAction(okAction)
            alertController.addAction(cancelAction)
            self.present(alertController, animated: true, completion: nil)
        } else {
            if self.tripTitleField.text == "" || self.startDateField.text == "" || self.endDateField.text == "" {
                return
            } else {
                self.doneButtonPressedNotifier?(TravelGuide(title: city.cityCommaCountry, coordinate: city.coordinate, tripTitle: self.tripTitleField.text!, startDate: self.startDateField.text!, endDate: self.endDateField.text!, tripOverview: self.tripOverviewField.html))
            }
            self.performSegueToReturnBack()
        }
        
    }
    
    // MARK: AvailableLocationsModelListenerProtocol
    func itemsChanged() {
        cityPicker.reloadAllComponents()
    }

    
    // MARK: UIpickerViewDataSource
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return availableLocations.numLocations()
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerData[row].cityCommaCountry
    }

}
