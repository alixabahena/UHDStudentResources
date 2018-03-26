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
    
    override init()
    {
        self.title = "Test"
        self.link = "Test"
        self.descriptions = "Test"
        self.pubDate = Date()
        self.category = "Test"
    }
    
    
    init(title: String, link: String, description: String, pubDate: Date, category: String ) {
        self.title = title
        self.link = link
        self.descriptions = description
        self.pubDate = pubDate
        self.category = category
    }
}
