//
//  Extensions.swift
//  Pokemon Go Pokedex
//
//  Created by Kashish Goel on 2016-07-11.
//  Copyright © 2016 Kashish Goel. All rights reserved.
//

import Foundation

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