//
//  EventStore.swift
//  UHDStudentResources
//
//  Created by Alixa Bahena on 3/18/18.
//  Copyright © 2018 Alixa Bahena. All rights reserved.
//

import Foundation
import FeedKit
class EventStore{
    var allEvents = [CalendarEvents]()
    init(){
       // let calendar = Calendar.current
        //var selectedDate = Date()
        //let month = calendar.component(.month, from: selectedDate)
        //self.populateMonth(month: month)
        self.populateEvents()
    }
    
   func populateEvents(){
        
        //feedkit variables
        let feedURL = URL(string: "https://calendar.uhd.edu/RSSSyndicator.aspx?category=&location=&type=N&starting=3/19/2018&ending=12/31/2018&binary=Y&keywords=")!
        var feed: RSSFeed?

        let parser = FeedParser(URL: feedURL)!

        let formatter = DateFormatter()
        
        formatter.dateFormat = "MM dd yyyy"
        
    parser.parseAsync { [weak self] (result) in
            feed = result.rssFeed
            let count: Int = (feed?.items?.count)!
            
            for index in 0...count-1 {
                //storage variables
                let title: String = feed?.items?[index].title ?? "[no title]"
                let link: String = feed?.items?[index].link ?? "[no link]"
                let descriptions: String = feed?.items?[index].description ?? "[no description]"
                let pubDate: Date = (feed?.items?[index].pubDate)! 
                let category: String = String(describing: feed?.items?[index].categories)
                
                let newEvent = CalendarEvents(title: title, link: link, description: descriptions, pubDate: pubDate, category: category)
                self?.allEvents.append(newEvent)
        }
}
    }
    
    func populateMonth(month:Int){
        
        //feedkit variables
        
        let feedURL = URL(string: "https://calendar.uhd.edu/RSSSyndicator.aspx?category=&location=&type=N&starting=\(month)/01/2018&ending=\(month)/31/2018&binary=Y&keywords=")!
        var feed: RSSFeed?
        
        let parser = FeedParser(URL: feedURL)!
        
        let formatter = DateFormatter()
        
        formatter.dateFormat = "MM dd yyyy"
        
        parser.parseAsync { [weak self] (result) in
            feed = result.rssFeed
            let count: Int = (feed?.items?.count)!
            
            for index in 0...count-1 {
                //storage variables
                let title: String = feed?.items?[index].title ?? "[no title]"
                let link: String = feed?.items?[index].link ?? "[no link]"
                let descriptions: String = feed?.items?[index].description ?? "[no description]"
                let pubDate: Date = (feed?.items?[index].pubDate)!
                let category: String = String(describing: feed?.items?[index].categories)
                
                let newEvent = CalendarEvents(title: title, link: link, description: descriptions, pubDate: pubDate, category: category)
                self?.allEvents.append(newEvent)
            }
        }
    }
    
    
}
