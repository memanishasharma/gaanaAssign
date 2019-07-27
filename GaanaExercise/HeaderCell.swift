//
//  HeaderCell.swift
//  GaanaExercise
//
//  Created by Manisha Sharma on 27/07/19.
//  Copyright © 2019 Manisha Sharma. All rights reserved.
//

import Foundation
import UIKit

class HeaderCell: UITableViewCell {
    
    @IBOutlet weak var headerLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.headerLabel.font = UIFont.systemFont(ofSize: 28, weight: .bold)
        self.headerLabel.textColor = .black
    }
}
