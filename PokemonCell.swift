//
//  PokemonCell.swift
//  Pokemon Go Pokedex
//
//  Created by Kashish Goel on 2016-07-11.
//  Copyright © 2016 Kashish Goel. All rights reserved.
//

import UIKit

class PokemonCell: UITableViewCell {
    @IBOutlet weak var img:UIImageView!
    @IBOutlet weak var name:UILabel!
 
    
    var pokemon: Pokemon!
    
    
    
    func configureCell(pokemon:Pokemon){
        self.pokemon = pokemon
        
        name.text = self.pokemon.name.capitalizedString
        img.image = UIImage(named: "\(self.pokemon.id)")
        
    }
    
}
