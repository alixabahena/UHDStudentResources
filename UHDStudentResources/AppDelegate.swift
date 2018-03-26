//
//  AppDelegate.swift
//  SideBarTest
//
//  Created by Alixa Bahena on 1/29/18.
//  Copyright © 2018 Alixa Bahena. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var events = [CalendarEvents]()
    var calendarView: CalendarViewController?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        DispatchQueue.global(qos: .utility).async {
            let otherVC = EventStore()
            otherVC.populateEvents()
            self.events = otherVC.allEvents


            DispatchQueue.main.async {
                print("Finished loading \(self.events.count) events")
            }
        }
        
//        let myGroup = DispatchGroup()
//        let otherVC = EventStore()
//        myGroup.enter()
//        otherVC.populateEvents()
//        self.events = otherVC.allEvents
//        myGroup.leave()
//        print("delegate view")
//        print(self.events.count)
//
//        myGroup.notify(queue: .main) {
//            print("Finished all requests.")
//        }
        
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

