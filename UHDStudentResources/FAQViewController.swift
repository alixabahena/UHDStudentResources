//
//  FAQViewController.swift
//  UHDStudentResources
//
//  Created by Alixa Bahena on 3/28/18.
//  Copyright © 2018 Alixa Bahena. All rights reserved.
//

import UIKit
import WebKit

class FAQViewController: UIViewController {
    
    
    @IBOutlet weak var webView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let url = URL(string: "https://www.uhd.edu/tsharveyresources/Pages/Student-Resources.aspx")
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
    
    
    override func viewWillAppear(_ animated: Bool) {
        
    }
}

