//
//  CalendarEvents.swift
//  UHDStudentResources
//
//  Created by Alixa Bahena on 2/10/18.
//  Copyright © 2018 Alixa Bahena. All rights reserved.
//

import UIKit
import FeedKit



class CalendarEvents: NSObject {
    
    var title: String
    var link: String
    var descriptions: String
    var pubDate: Date
    var category: String
    var starttime: String
    var endtime: String
    var startdate: String
    var enddate: String
    
    override init()
    {
        self.title = "Test"
        self.link = "Test"
        self.descriptions = "Test"
        self.pubDate = Date()
        self.category = "Test"
        self.startdate = "Test"
        self.enddate = "Test"
        self.starttime = "Test"
        self.endtime = "Test"
    }
    
    
    init(title: String, link: String, description: String, pubDate: Date, category: String , starttime: String, endtime: String, startdate: String, enddate: String) {
        self.title = title
        self.link = link
        self.descriptions = description
        self.pubDate = pubDate
        self.category = category
        self.startdate = startdate
        self.enddate = enddate
        self.starttime = starttime
        self.endtime = endtime
    }
}
