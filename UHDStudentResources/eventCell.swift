//
//  eventCell.swift
//  UHDStudentResources
//
//  Created by Alixa Bahena on 2/12/18.
//  Copyright © 2018 Alixa Bahena. All rights reserved.
//

import Foundation
import UIKit

class eventCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.titleLabel.text = nil
        self.dateLabel.text = nil
    }
}
