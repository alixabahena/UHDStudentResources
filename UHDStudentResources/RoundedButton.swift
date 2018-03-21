//
//  RoundedButton.swift
//  UHDStudentResources
//
//  Created by Alixa Bahena on 2/28/18.
//  Copyright © 2018 Alixa Bahena. All rights reserved.
//

import Foundation
import UIKit


@IBDesignable class RoundedButton: UIButton
{
    override func layoutSubviews() {
        super.layoutSubviews()
        
        updateCornerRadius()
    }
    
    @IBInspectable var rounded: Bool = false {
        didSet {
            updateCornerRadius()
        }
    }
    
    func updateCornerRadius() {
        layer.cornerRadius = rounded ? frame.size.height / 2 : 0
    }
}
