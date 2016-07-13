//
//  PokemonCell.swift
//  Pokemon Go Pokedex
//
//  Created by Kashish Goel on 2016-07-11.
//  Copyright © 2016 Kashish Goel. All rights reserved.
//
import Foundation
import UIKit

class PokemonCell: UITableViewCell {
    @IBOutlet weak var img:UIImageView!
    @IBOutlet weak var name:UILabel!
    @IBOutlet weak var type1:UILabel!
    @IBOutlet weak var type2:UILabel!
    @IBOutlet weak var soloType:UILabel!
 
    
    var pokemon: Pokemon!
   // var color:Int!
    
    let typeColor = ["Water":0x4993C2, "Grass":0x9CCA58, "Poison":0xB881C7, "Fire":0xFB7D33, "Bug":0x739E45,"Normal":0xA4ACAF, "Electric":0xEDD447, "Ground":0xAA9748, "Fairy":0xFCBAE8, "Fighting":0xD3672E, "Psychic":0xF169B8, "Flying":0x46C7ED, "Rock":0xA28B2,  ]
    
    
    
    func configureCell(pokemon:Pokemon){
        self.pokemon = pokemon
        
        name.text = self.pokemon.name.capitalizedString
        img.image = UIImage(named: "\(self.pokemon.id)")
        if self.pokemon.type2 != "" {
        type2.text = pokemon.type2
        type1.text = pokemon.type1
            if let color1:Int = typeColor[pokemon.type1],color2:Int = typeColor[pokemon.type2] {
               
                type1.backgroundColor = UIColor(hex: color1)
                type2.backgroundColor = UIColor(hex: color2)
                
            }
            
        
        }
            
        
        else{
            soloType.hidden = false
            soloType.text = pokemon.type1
            
            if let color:Int = typeColor[pokemon.type1]{
            soloType.backgroundColor = UIColor(hex: color)
            }
            
            type2.hidden = true
            type1.hidden = true
        
        }
        
    }
    
}
