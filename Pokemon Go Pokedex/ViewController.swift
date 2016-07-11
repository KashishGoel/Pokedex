//
//  ViewController.swift
//  Pokemon Go Pokedex
//
//  Created by Kashish Goel on 2016-07-10.
//  Copyright © 2016 Kashish Goel. All rights reserved.
//
import Foundation
import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var tableView:UITableView!
    
    var pokemon = [Pokemon]()

    override func viewDidLoad() {
        super.viewDidLoad()
    
        tableView.delegate = self
        tableView.dataSource = self
       
        parsePokemon()
        // Do any additional setup after loading the view, typically from a nib.
    }

    
    func parsePokemon(){
        
        let path = NSBundle.mainBundle().pathForResource("pokemon", ofType: "csv")
        
        do {
        let csv = try CSV(contentsOfURL: path!)
            let rows = csv.rows
            
            for row in rows{
                if let pokeId = Int(row["id"]!), pokeName = row["identifier"]{
                    
                    let pokemon_ = Pokemon(name: pokeName, id: pokeId)
                    pokemon.append(pokemon_)
                
                }
            
            }
            
            
        } catch let error as NSError{
       print(error.debugDescription)
        
        }
        
    
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }

    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCellWithIdentifier("PokemonCell") as? PokemonCell {
//            let pokemon = Pokemon(name: "Test", id: indexPath.row + 1)
            
            let pokemon_ = pokemon[indexPath.row + 1]
            
            cell.configureCell(pokemon_)
        return cell
        }
        
        else {
        
        return UITableViewCell()
        }
        
    }
    
    
}


