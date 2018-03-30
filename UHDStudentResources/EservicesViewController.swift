//
//  EservicesViewController.swift
//  SideBarTest
//
//  Created by Alixa Bahena on 2/9/18.
//  Copyright © 2018 Alixa Bahena. All rights reserved.
//

import UIKit
import LUExpandableTableView
import WebKit

class EservicesViewController: UIViewController {
    
    
    @IBOutlet weak var cancelButton: UIBarButtonItem!
    @IBOutlet weak var webView: WKWebView!
    @IBOutlet weak var passwordAssistButton: RoundedButton!
    
    @IBAction func cancelPressed(_ sender: Any) {
        webView.isHidden = true
    }
    @IBAction func personalPressed(_ sender: Any) {
        let personal = "https://global.dt.uh.edu/eservices/es/login.asp?MySelection=P"
        webViewUpdate(websiteString: personal)
    }
    
    @IBAction func schedulePressed(_ sender: Any) {
        let scheduler = "https://global.dt.uh.edu/eservices/es/login.asp?MySelection=S"
        webViewUpdate(websiteString: scheduler)
    }
    
    @IBAction func blackboardPressed(_ sender: Any) {
        let bb = "https://bb.uhd.edu"
        webViewUpdate(websiteString: bb)
    }
    
    @IBAction func gradesPressed(_ sender: Any) {
        let grades = "https://global.dt.uh.edu/eservices/es/login.asp?MySelection=G"
        webViewUpdate(websiteString: grades)
    }
    
    @IBAction func paymentPressed(_ sender: Any) {
        let payment = "https://global.dt.uh.edu/eservices/es/login.asp?MySelection=F"
        webViewUpdate(websiteString: payment)
    }
    
    @IBAction func gatormailPressed(_ sender: Any) {
        let gatormail = "https://login.microsoftonline.com/common/oauth2/authorize?client_id=00000002-0000-0ff1-ce00-000000000000&redirect_uri=https%3a%2f%2foutlook.office.com%2fowa%2f&resource=00000002-0000-0ff1-ce00-000000000000&response_mode=form_post&response_type=code+id_token&scope=openid&msafed=0&client-request-id=eb39a3a2-a3b1-43d3-bf8d-a514b9e41e72&protectedtoken=true&domain_hint=gator.uhd.edu&nonce=636578570850096298.00c3208a-4db1-4215-b626-ce9f97a18ef2&state=DctBDsIgEEBR0Lu4MdCBlmFYNN7BG0xhak00TQjE68vi_d3XSqnrcBk0jKiIM4ZIIQIFgIQ-kQXIswdis5TNmcW7YDb0aLKkPUV2JLvX471P54-nRxX-fNcXt7PafhQrpd-4t-Mp5V0lt7XVLn8"
        webViewUpdate(websiteString: gatormail)
    }
    
    @IBAction func signIn(sender: AnyObject) {
        
        let passwordAssist = "https://myidentity.uhd.edu/"
       webViewUpdate(websiteString: passwordAssist)
    }
    
    func webViewUpdate(websiteString: String)
    {
        let url = URL(string: websiteString)
        if let unwrappedURL = url {
            let request = URLRequest(url: unwrappedURL)
            let session = URLSession.shared
            
            let task = session.dataTask(with: request) { (data, response, error) in
                
                if error == nil {
                    DispatchQueue.main.async { // Correct
                        self.cancelButton.isEnabled = true
                        self.webView.load(request)
                          self.webView.isHidden = false
                    }
                } else {
                    print("Error: \(String(describing: error))")
                }
                
            }
            task.resume()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.webView.contentMode = UIViewContentMode.scaleAspectFit
        self.cancelButton.isEnabled = false
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}




