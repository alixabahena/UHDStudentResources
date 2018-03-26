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
        let url = URL(string: "https://myidentity.uhd.edu/idp/AuthnEngine")
        
        // Note that you will want to use a `NSMutableURLRequest`
        // because otherwise, you will not be able to edit the `request.HTTPMethod`
        let request = NSMutableURLRequest(url: url!)
        
        // You need to specifically tell the request what HTTP method to use
        // (e.g., GET, POST, PUT, DELETE)
        request.httpMethod = "POST"
        
        // Is this generated/an API key? If generated per user, use `var`
        let loginUser: String = "c7e28a618886dba19eac0892ad90cf51"
        
        // The page you want to go to after login
      
        let redirectPage: String = "https://myidentity.uhd.edu/arms/protected/"
        
        // Get the user's credentials from the `UITextField`s
        let username: String = "bahenaa"
        let password: String = "M@rried1Ye@r"
        
        // Concatenating everything together
        let userCredentials: String = "EPostam=\(username)&Sifrem=\(password)"
        let bodyData: String = "\(userCredentials)&RTrn=\(redirectPage)&LoginUser=\(loginUser)"
        
        // Encode the bodyData string into a
        request.httpBody = bodyData.data(using: String.Encoding.utf8)
        
        // load the UIWebView `webView` with this request
        webView.isHidden = false
        webView.load(request as URLRequest)
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



