//
//  MenuViewController.swift
//  SideBarTest
//
//  Created by Alixa Bahena on 2/1/18.
//  Copyright © 2018 Alixa Bahena. All rights reserved.
//

import UIKit
import SideMenu
import JTImageButton

class MenuViewController: UIViewController {
    
    @IBOutlet var busRoutesButton: JTImageButton!
    @IBOutlet weak var homeButton: JTImageButton!
    @IBOutlet weak var scheduleButton: JTImageButton!
    @IBOutlet weak var mapButton: JTImageButton!
    @IBOutlet weak var calendarButton: JTImageButton!
    @IBOutlet weak var resourcesButton: JTImageButton!
    @IBOutlet weak var faqButton: JTImageButton!
    @IBOutlet weak var diningButton: JTImageButton!
    @IBOutlet weak var bookstoreButton: JTImageButton!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        let logo = UIImage(named: "logo.png")
        let imageView = UIImageView(image: logo)
        imageView.contentMode = .scaleAspectFit // set imageview's content mode
        self.navigationItem.titleView = imageView
        
        //preload webviews
        DiningServicesViewController().view.setNeedsLayout()
        //BookstoreViewController().viewDidLayoutSubviews()
        // FAQViewController().loadViewIfNeeded()
        // BusRoutesViewController().loadViewIfNeeded()
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        customizeMenuButtons()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    func customizeMenuButtons(){
        //Home Button
       _ = [self.homeButton .createTitle("Home", withIcon: #imageLiteral(resourceName: "home-2"), font: UIFont(name: "Futura-Medium", size: 18), iconHeight: JTImageButtonIconHeightDefault, iconOffsetY: 3.0)]
        self.homeButton.iconColor = UIColor(named: "UHDBlue")
        self.homeButton.titleColor = UIColor(named: "UHDBlue")
        self.homeButton.padding = JTImageButtonPaddingMedium
        self.homeButton.borderColor = UIColor.white
        self.homeButton.borderWidth = 0.0
        
        //Schedule Button
        _ = [self.scheduleButton .createTitle("MyUHD", withIcon: #imageLiteral(resourceName: "schedule"), font: UIFont(name: "Futura-Medium", size: 18), iconHeight: JTImageButtonIconHeightDefault, iconOffsetY: 3.0)]
        self.scheduleButton.iconColor = UIColor(named: "UHDBlue")
        self.scheduleButton.titleColor = UIColor(named: "UHDBlue")
        self.scheduleButton.padding = JTImageButtonPaddingMedium
        self.scheduleButton.borderColor = UIColor.white
        self.scheduleButton.borderWidth = 0.0

        
        //Map Button
        _ = [self.mapButton .createTitle("Map", withIcon: #imageLiteral(resourceName: "006-location-1"), font: UIFont(name: "Futura-Medium", size: 18), iconHeight: JTImageButtonIconHeightDefault, iconOffsetY: 3.0)]
        self.mapButton.iconColor = UIColor(named: "UHDBlue")
        self.mapButton.titleColor = UIColor(named: "UHDBlue")
        self.mapButton.padding = JTImageButtonPaddingMedium
        self.mapButton.borderColor = UIColor.white
        self.mapButton.borderWidth = 0.0

        
        //Calendar Button
        _ = [self.calendarButton .createTitle("Academic Calendar", withIcon: #imageLiteral(resourceName: "024-calendar"), font: UIFont(name: "Futura-Medium", size: 18), iconHeight: JTImageButtonIconHeightDefault, iconOffsetY: 3.0)]
        self.calendarButton.iconColor = UIColor(named: "UHDBlue")
        self.calendarButton.titleColor = UIColor(named: "UHDBlue")
        self.calendarButton.padding = JTImageButtonPaddingMedium
        self.calendarButton.borderColor = UIColor.white
        self.calendarButton.borderWidth = 0.0

        
        //Bus Button
        _ = [self.busRoutesButton .createTitle("Bus Routes", withIcon: #imageLiteral(resourceName: "004-bus"), font: UIFont(name: "Futura-Medium", size: 18), iconHeight: JTImageButtonIconHeightDefault, iconOffsetY: 3.0)]
        self.busRoutesButton.iconColor = UIColor(named: "UHDBlue")
        self.busRoutesButton.titleColor = UIColor(named: "UHDBlue")
        self.busRoutesButton.padding = JTImageButtonPaddingMedium
        self.busRoutesButton.borderColor = UIColor.white
        self.busRoutesButton.borderWidth = 0.0

        
        //Resources Button
        _ = [self.resourcesButton .createTitle("Resources", withIcon: #imageLiteral(resourceName: "interview"), font: UIFont(name: "Futura-Medium", size: 18), iconHeight: JTImageButtonIconHeightDefault, iconOffsetY: 3.0)]
        self.resourcesButton.iconColor = UIColor(named: "UHDBlue")
        self.resourcesButton.titleColor = UIColor(named: "UHDBlue")
        self.resourcesButton.padding = JTImageButtonPaddingMedium
        self.resourcesButton.borderColor = UIColor.white
        self.resourcesButton.borderWidth = 0.0

        
        //Resources Button
       _ = [self.faqButton .createTitle("FAQ", withIcon: #imageLiteral(resourceName: "question"), font: UIFont(name: "Futura-Medium", size: 18), iconHeight: JTImageButtonIconHeightDefault, iconOffsetY: 3.0)]
        self.faqButton.iconColor = UIColor(named: "UHDBlue")
        self.faqButton.titleColor = UIColor(named: "UHDBlue")
        self.faqButton.padding = JTImageButtonPaddingMedium
        self.faqButton.borderColor = UIColor.white
        self.faqButton.borderWidth = 0.0
        
        
        //Dining Services Button
        _ = [self.diningButton .createTitle("Dining Services", withIcon: #imageLiteral(resourceName: "002-fast-food"), font: UIFont(name: "Futura-Medium", size: 18), iconHeight: JTImageButtonIconHeightDefault, iconOffsetY: 3.0)]
        self.diningButton.iconColor = UIColor(named: "UHDBlue")
        self.diningButton.titleColor = UIColor(named: "UHDBlue")
        self.diningButton.padding = JTImageButtonPaddingMedium
        self.diningButton.borderColor = UIColor.white
        self.diningButton.borderWidth = 0.0

        
        //Bookstore Button
        _ = [self.bookstoreButton .createTitle("Bookstore", withIcon: #imageLiteral(resourceName: "004-books-stack-of-three"), font: UIFont(name: "Futura-Medium", size: 18), iconHeight: JTImageButtonIconHeightDefault, iconOffsetY: 3.0)]
        self.bookstoreButton.iconColor = UIColor(named: "UHDBlue")
        self.bookstoreButton.titleColor = UIColor(named: "UHDBlue")
        self.bookstoreButton.padding = JTImageButtonPaddingMedium
        self.bookstoreButton.borderColor = UIColor.white
        self.bookstoreButton.borderWidth = 0.0
    }

}

