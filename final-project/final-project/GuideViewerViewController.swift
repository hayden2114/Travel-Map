//
//  GuideViewerViewController.swift
//  final-project
//
//  Created by Hayden Greer on 7/17/17.
//  Copyright © 2017 Hayden Greer. All rights reserved.
//
import Foundation
import UIKit
import RichEditorView

class GuideViewerViewController: UIViewController {
    
    var startDate: String?
    var endDate: String?
    var tripOverview: String?

    
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
    
    @IBOutlet var tripOverviewView: RichEditorView! {
        didSet {
            tripOverviewView.html = tripOverview!
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tripOverviewView.isEditingEnabled = false

    }

}
