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
//    init(){
//
//        self.populateEvents()
//    }
    
    func populateEvents(feedURL:URL){
        
    //feedkit variables
    // let feedURL = URL(string: "https://calendar.uhd.edu/RSSSyndicator.aspx?category=&location=&type=N&starting=1/01/2018&ending=12/31/2018&binary=Y&keywords=")!
    
    //let feedURL = Bundle.main.url(forResource: "UHDCalendar", withExtension: "rss")!
    var feed: RSSFeed?
    let parser = FeedParser(URL: feedURL)!
    let formatter = DateFormatter()
    formatter.dateFormat = "MM dd yyyy"
        
    //parser.parseAsync { [weak self] (result) in
           // feed = result.rssFeed
        let result = parser.parse()
        feed = result.rssFeed
        let count: Int = (feed?.items?.count)!
            for index in 0...count-1 {
                //storage variables
                let title: String = feed?.items?[index].title ?? "[no title]"
                let link: String = feed?.items?[index].link ?? "[no link]"
                let descriptions: String = feed?.items?[index].description ?? "[no description]"
                let pubDate: Date = (feed?.items?[index].pubDate)! 
                let category: String = String(describing: feed?.items![index].categories!.last!.value ?? "[N/A]")
                let startdate: String = feed?.items![index].startdate ?? "[N/A]"
                let enddate: String = feed?.items![index].enddate ?? "[N/A]"
                let starttime: String = feed?.items![index].starttime ?? "[N/A]"
                let endtime: String = feed?.items![index].endtime ?? "[N/A]"
                let newEvent = CalendarEvents(title: title, link: link, description: descriptions, pubDate: pubDate, category: category , starttime: starttime, endtime: endtime, startdate: startdate, enddate: enddate)
                self.allEvents.append(newEvent)
        }
//}
    }
    
}
