//
//  DiningServicesViewController.swift
//  UHDStudentResources
//
//  Created by Alixa Bahena on 4/19/18.
//  Copyright © 2018 Alixa Bahena. All rights reserved.
//

import UIKit
import WebKit

class DiningServicesViewController: UIViewController{
    
    @IBOutlet var webView: WKWebView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let urlstring: String! = "https://www.dineoncampus.com/UHD"
        let url = URL(string: urlstring)

        if let unwrappedURL = url {
            let request = URLRequest(url: unwrappedURL)
            let session = URLSession.shared

            let task = session.dataTask(with: request) { (data, response, error) in

                if error == nil {
                    DispatchQueue.main.async { // Correct
                        self.webView?.load(request)
                        self.webView?.contentMode = UIViewContentMode.scaleAspectFit

                    }
                } else {
                    print("Error: \(String(describing: error))")
                }

            }
            task.resume()
        }
    }
    
    
}
