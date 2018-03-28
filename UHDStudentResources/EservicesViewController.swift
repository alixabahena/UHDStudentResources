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
    
    
    @IBOutlet weak var webView: WKWebView!
    @IBOutlet weak var passwordAssistButton: RoundedButton!
    
    // fire when the UIButton for "sign in" or "Giriş Yap" is pressed
    @IBAction func signIn(sender: AnyObject) {
        
        let url = URL(string: "https://myidentity.uhd.edu/")
        if let unwrappedURL = url {
            let request = URLRequest(url: unwrappedURL)
            let session = URLSession.shared
            
            let task = session.dataTask(with: request) { (data, response, error) in
                
                if error == nil {
                    DispatchQueue.main.async { // Correct
                        self.webView.isHidden = false
                        self.webView.load(request)
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
    
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}



