//
//  CampusMapView.swift
//  UHDStudentResources
//
//  Created by Alixa Bahena on 2/28/18.
//  Copyright © 2018 Alixa Bahena. All rights reserved.
//

import Foundation
import UIKit
import WebKit

class CampusMapView: UIViewController {
    
    @IBOutlet weak var webView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let url = URL(string: "https://map.concept3d.com/?id=1133#!ct/25343,0")
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
