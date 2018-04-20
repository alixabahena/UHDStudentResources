//
//  EventDetailsViewController.swift
//  UHDStudentResources
//
//  Created by Alixa Bahena on 4/11/18.
//  Copyright © 2018 Alixa Bahena. All rights reserved.
//

import UIKit

class EventDetailsViewController: UIViewController {
    
    @IBOutlet weak var eventName: UILabel!
    @IBOutlet weak var eventLocation: UILabel!
    @IBOutlet weak var eventTime: UILabel!
    @IBOutlet weak var eventHost: UITextView!
    @IBOutlet weak var eventDesc: UITextView!
    
    @IBAction func dismissButtonClicked(_ sender: UIBarButtonItem) {
        dismiss(animated: true) {}
    }
    
    var name = String()
    var location = String()
    var time = String()
    var host = String()
    var desc = String()
    
    override func viewWillAppear(_ animated: Bool) {
        eventName.text = name
        eventLocation.text = location
        eventTime.text = time
        eventHost.text = host
        eventDesc.text = desc
        
        eventHost.isScrollEnabled = false
        eventHost.isScrollEnabled = true
        eventHost.sizeToFit()

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
}

