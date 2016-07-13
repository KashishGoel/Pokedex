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
    private var _type1:String!
    private var _type2:String!
    
    var name:String {
        return _name
    }
    
    var id:Int {
    return _id
    }
    
    var type1:String{
    return _type1
    }
    
    var type2:String{
    return _type2
    }
    
    
    init(name:String, id:Int, type1:String, type2:String){
       self._name = name
        self._id = id
        self._type1 = type1
        self._type2 = type2
    }

}