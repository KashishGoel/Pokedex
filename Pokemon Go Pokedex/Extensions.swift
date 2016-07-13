//
//  Extensions.swift
//  Pokemon Go Pokedex
//
//  Created by Kashish Goel on 2016-07-11.
//  Copyright © 2016 Kashish Goel. All rights reserved.
//

import Foundation
import UIKit

public let pokemonTypeColor = ["Water":0x4993C2, "Grass":0x9CCA58, "Poison":0xB881C7, "Fire":0xFB7D33, "Bug":0x739E45, "Electric":0xEDD447, "Ground":0xAA9748, "Fairy":0xFCBAE8, "Fighting":0xD3672E, "Psychic":0xF169B8, "Flying":0x9DAFF5, "Rock":0xBCA45F, "Steel":0xADADC5, "Ice":0x60CEE5, "Ghost":0x6365B3, "Dragon":0x7C6DCA, "Normal ":0x696763, ]

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