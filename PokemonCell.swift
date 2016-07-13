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
    
   
    
    
    func configureCell(pokemon:Pokemon){
        self.pokemon = pokemon
        
        name.text = self.pokemon.name
        img.image = UIImage(named: "\(self.pokemon.id)")
        if self.pokemon.type2 != "" {
        type2.text = pokemon.type2
        type1.text = pokemon.type1
            if let color1:Int = pokemonTypeColor[pokemon.type1],color2:Int = pokemonTypeColor[pokemon.type2] {
               
                type1.backgroundColor = UIColor(hex: color1)
                type2.backgroundColor = UIColor(hex: color2)
                
            }
            
        
        }
            
        
        else{
            soloType.hidden = false
            type2.hidden = true
            type1.hidden = true
            soloType.text = pokemon.type1
           // print(pokemon.type1 + "\(pokemonTypeColor[pokemon.type1])")
            
            
            if let color:Int = pokemonTypeColor[pokemon.type1.capitalizedString]{
            soloType.backgroundColor = UIColor(hex: color)
            }
            
          
        
        }
        
    }
    
    func hexStringToUIColor (hex:String) -> UIColor {
        var cString:String = hex.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet() as NSCharacterSet).uppercaseString
        
        if (cString.hasPrefix("#")) {
            cString = cString.substringFromIndex(cString.startIndex.advancedBy(1))
        }
        
        if ((cString.characters.count) != 6) {
            return UIColor.grayColor()
        }
        
        var rgbValue:UInt32 = 0
        NSScanner(string: cString).scanHexInt(&rgbValue)
        
        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
    
}
