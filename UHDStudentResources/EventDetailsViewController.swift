//
//  EventDetailsViewController.swift
//  UHDStudentResources
//
//  Created by Alixa Bahena on 4/11/18.
//  Copyright © 2018 Alixa Bahena. All rights reserved.
//

import UIKit
import EventKit

class EventDetailsViewController: UIViewController {
    
    @IBOutlet weak var addEvent: UIBarButtonItem!
    @IBOutlet weak var eventName: UILabel!
    @IBOutlet weak var eventLocation: UILabel!
    @IBOutlet weak var eventTime: UILabel!
    @IBOutlet weak var eventHost: UITextView!
    @IBOutlet weak var eventDesc: UITextView!
    
    @IBAction func dismissButtonClicked(_ sender: UIBarButtonItem) {
        dismiss(animated: true) {}
    }
    
    @IBAction func addEventClicked(_ sender: Any) {
        addEventToCalendar(title: name, description: desc, startDate: date, endDate: date)

    }
    
    var name = String()
    var location = String()
    var time = String()
    var host = String()
    var desc = String()
    var date = Date()
    
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
    
    func addEventToCalendar(title: String, description: String?, startDate: Date, endDate: Date, completion: ((_ success: Bool, _ error: NSError?) -> Void)? = nil) {
        let eventStore = EKEventStore()
        
        eventStore.requestAccess(to: .event, completion: { (granted, error) in
            if (granted) && (error == nil) {
                let event = EKEvent(eventStore: eventStore)
                event.title = title
                event.startDate = startDate
                event.endDate = endDate
                event.notes = description
                event.calendar = eventStore.defaultCalendarForNewEvents
                do {
                    try eventStore.save(event, span: .thisEvent)
                } catch let e as NSError {
                    completion?(false, e)
                    return
                }
                completion?(true, nil)
                // create the alert
                let alert = UIAlertController(title: "Add Event", message: "Event was added to calendar.", preferredStyle: UIAlertControllerStyle.alert)
                
                // add an action (button)
                alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
                
                // show the alert
                self.present(alert, animated: true, completion: nil)
            } else {
                completion?(false, error as NSError?)
            }
        })
    }
}

