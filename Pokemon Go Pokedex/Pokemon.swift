//
//  Pokemon.swift
//  Pokemon Go Pokedex
//
//  Created by Kashish Goel on 2016-07-10.
//  Copyright © 2016 Kashish Goel. All rights reserved.
//

import Foundation


class Pokemon{

    private var _name:String!
    private var _id:Int!

    
    var name:String {
        return _name
    }
    
    var id:Int {
    return _id
    }
    
    
    
    
    init(name:String, id:Int){
       self._name = name
        self._id = id
    }

}