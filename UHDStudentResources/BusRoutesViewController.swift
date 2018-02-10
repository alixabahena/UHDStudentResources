//
//  BusRoutesViewController.swift
//  SideBarTest
//
//  Created by Alixa Bahena on 2/1/18.
//  Copyright © 2018 Alixa Bahena. All rights reserved.
//

import UIKit
import WebKit

class BusRoutesViewController: UIViewController {
  
    @IBOutlet weak var webView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let url = URL(string: "http://uhd.etaspot.net")
        if let unwrappedURL = url {
            let request = URLRequest(url: unwrappedURL)
            let session = URLSession.shared

            let task = session.dataTask(with: request) { (data, response, error) in

                if error == nil {
                    DispatchQueue.main.async { // Correct
                         self.webView.load(request)
                    }
                } else {
                    print("Error: \(String(describing: error))")
                }

            }
            task.resume()
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
