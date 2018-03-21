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
    
    func getRSSFeed(){
        let feedURL = URL(string: "https://calendar.uhd.edu/RSSSyndicator.aspx?category=&location=&type=N&starting=2/10/2018&ending=2/23/2018&binary=Y&keywords=")!
        var feed: RSSFeed?
        let parser = FeedParser(URL: feedURL)!
        let formatter = DateFormatter()
        
        formatter.dateFormat = "MM dd yyyy"
        parser.parseAsync { [weak self] (result) in
            feed = result.rssFeed
            let count: Int = (feed?.items?.count)!
            let returnEvent = CalendarEvents()
            
            for index in 0...count-1 {
                returnEvent.setValue(feed?.items?[index].title ?? "[no title]", forKey: (self?.title)!)

//                self?.title = feed?.items?[index].title ?? "[no title]"
//                self?.link = feed?.items?[index].link ?? "[no link]"
//                self?.descriptions = feed?.items?[index].description ?? "[no description]"
//                self?.pubDate = String(describing: feed?.items?[index].pubDate)
//                self?.category = String(describing: feed?.items?[index].categories)
                
               
            }
        }
    }
    
}
