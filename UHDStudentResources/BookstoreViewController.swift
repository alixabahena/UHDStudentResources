//
//  BookstoreViewController.swift
//  UHDStudentResources
//
//  Created by Alixa Bahena on 4/19/18.
//  Copyright © 2018 Alixa Bahena. All rights reserved.
//

import UIKit
import WebKit

class BookstoreViewController: UIViewController{
    
    @IBOutlet weak var webView: WKWebView!
    
    override func viewWillAppear(_ animated: Bool) {
       
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let url = URL(string: "http://uh-downtown.bncollege.com/webapp/wcs/stores/servlet/BNCBHomePage?storeId=19558&catalogId=10001&langId=-1")
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
    
    
}
