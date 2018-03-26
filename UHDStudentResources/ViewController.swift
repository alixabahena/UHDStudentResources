//
//  ViewController.swift
//  SideBarTest
//
//  Created by Alixa Bahena on 1/29/18.
//  Copyright © 2018 Alixa Bahena. All rights reserved.
//

import UIKit
import SideMenu
import SafariServices
import Jupiter

class ViewController: UIViewController {
    
    @IBOutlet weak var facebookButton: UIButton!
    @IBOutlet weak var twitterButton: UIButton!
    @IBOutlet weak var youtubeButton: UIButton!
    @IBOutlet weak var linkedinButton: UIButton!
    @IBOutlet weak var weatherView: UIView!
    @IBOutlet weak var conditionLabel: UILabel!
    @IBOutlet weak var weatherIcon: UILabel!
    @IBOutlet weak var tempLabel: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        // Define the menus
        SideMenuManager.defaultManager.menuPresentMode = .menuSlideIn
        SideMenuManager.defaultManager.menuAnimationFadeStrength = 0.65
        SideMenuManager.defaultManager.menuAnimationTransformScaleFactor = 1
        SideMenuManager.defaultManager.menuWidth = max(round(min((UIScreen.main.bounds.width), (UIScreen.main.bounds.height)) * 0.50), 240)
         SideMenuManager.defaultManager.menuAddPanGestureToPresent(toView: self.navigationController!.navigationBar)
        SideMenuManager.defaultManager.menuAddScreenEdgePanGesturesToPresent(toView: self.navigationController!.view)

    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        //weather view
        //        weatherView.layer.shadowColor = UIColor.lightGray.cgColor
        //        weatherView.layer.shadowOpacity = 1
        //        weatherView.layer.shadowOffset = CGSize.zero
        //        weatherView.layer.shadowRadius = 1
        //        weatherView.layer.shouldRasterize = true
        //        weatherView.layer.opacity = 0.95
        getWeather()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func menuButton(_ sender: UIBarButtonItem) {
    
    present(SideMenuManager.defaultManager.menuLeftNavigationController!, animated: true, completion: nil)
        
    }
    
    @IBAction func facebookButtonClicked(_ sender: UIButton) {
         let facebookURL = URL(string: "https://www.facebook.com/uhdowntown/")
        let svc = SFSafariViewController(url: facebookURL!)
        present(svc, animated: false, completion: nil)
    }
    
    @IBAction func twitterButtonClicked(_ sender: UIButton) {
        let twitterURL = URL(string: "https://twitter.com/UHDowntown")
        let svc = SFSafariViewController(url: twitterURL!)
        present(svc, animated: false, completion: nil)
    }
    @IBAction func youtubeButtonClicked(_ sender: UIButton) {
        let youtubeURL = URL(string: "https://www.youtube.com/user/uhdpublicaffairs")
        let svc = SFSafariViewController(url: youtubeURL!)
        present(svc, animated: false, completion: nil)
    }
    
    @IBAction func linkedinButtonClicked(_ sender: UIButton) {
        let linkedinURL = URL(string: "https://www.linkedin.com/school/464218")
        let svc = SFSafariViewController(url: linkedinURL!)
        present(svc, animated: false, completion: nil)
    }
    
    func getWeather(){
        let api = DarkSkyAPI(key: "5c767b51fa4e86ac4f095ddae3e262ed")
        api.forecast(latitude: 29.764548, longitude: -95.362819).send { result -> Void in
            switch result {
            case .success(let response):
               DispatchQueue.main.async {
                let temp: Int = Int((response.currently?.apparentTemperature)!)
                self.tempLabel.text = "\(temp)°"
                self.conditionLabel.text = response.currently?.summary
                self.weatherIcon.text = (response.currently?.icon).map { $0.rawValue }
                //print(response)
                }
            case .error(let error):
                print(error)
            }
        }
        
    }
}

