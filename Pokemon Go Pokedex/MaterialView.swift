//
//  MaterialView.swift
//  Pokemon Go Pokedex
//
//  Created by Kashish Goel on 2016-07-11.
//  Copyright © 2016 Kashish Goel. All rights reserved.
//

import UIKit

class MaterialView: UIView {
    
    override func awakeFromNib() {
        layer.shadowColor = UIColor.lightGrayColor().CGColor
        layer.shadowRadius = 3.0
        layer.shadowOffset = CGSizeMake(1.0, 2.0)
        layer.cornerRadius = 10.0
        layer.shadowOpacity = 0.8
    }

}
