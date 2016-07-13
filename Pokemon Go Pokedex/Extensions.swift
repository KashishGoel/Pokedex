//
//  Extensions.swift
//  Pokemon Go Pokedex
//
//  Created by Kashish Goel on 2016-07-11.
//  Copyright © 2016 Kashish Goel. All rights reserved.
//

import Foundation
import UIKit

extension Array{
    
    mutating func randomize(){
        if count < 2 {
            
        }
       
        
        for x in 0 ..< (count - 1) {
            let i = Int(arc4random_uniform(UInt32(count - x))) + x
            
            guard x != i
                else {
                    continue
            }
            
            swap(&self[x], &self[i])
        }
        
        
        
    }
}

extension UIColor {
    
    convenience init(hex: Int) {
        
        let components = (
            R: CGFloat((hex >> 16) & 0xff) / 255,
            G: CGFloat((hex >> 08) & 0xff) / 255,
            B: CGFloat((hex >> 00) & 0xff) / 255
        )
        
        self.init(red: components.R, green: components.G, blue: components.B, alpha: 1)
        
    }
    
}