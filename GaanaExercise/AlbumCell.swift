//
//  AlbumCell.swift
//  GaanaExercise
//
//  Created by Manisha Sharma on 27/07/19.
//  Copyright © 2019 Manisha Sharma. All rights reserved.
//

import Foundation
import UIKit


import Foundation

struct Album {
    let itemId: String
    let name: String
    let atw: String
}

class AlbumCell: UICollectionViewCell {
    
    @IBOutlet weak var textLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.initialize()
    }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        self.initialize()
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.textLabel.font = UIFont.systemFont(ofSize: 12, weight: .bold)
        self.textLabel.textColor = .black

        self.imageView.layer.cornerRadius = 8
        self.imageView.layer.masksToBounds = true
    }
    
    
    private func initialize() {
        
    }
}
