//
//  MaterialButton.swift
//  Pokemon Go Pokedex
//
//  Created by Kashish Goel on 2016-07-13.
//  Copyright © 2016 Kashish Goel. All rights reserved.
//

import Foundation
import UIKit

class MaterialLabel:UILabel{

    override func awakeFromNib() {
        layer.shadowRadius = 1.0
        layer.shadowColor = UIColor.lightGrayColor().CGColor
        layer.shadowOpacity = 0.6
        layer.shadowOffset = CGSizeMake(1.0, 2.0)
        layer.cornerRadius = 5.0
    }
    
    
}