//
//  ViewController.swift
//  Pokemon Go Pokedex
//
//  Created by Kashish Goel on 2016-07-10.
//  Copyright © 2016 Kashish Goel. All rights reserved.
//
import Foundation
import UIKit


class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate, UIPopoverPresentationControllerDelegate {
    @IBOutlet weak var tableView:UITableView!
    @IBOutlet weak var searchBar:UISearchBar!
    var pokemon = [Pokemon]()
    var pokemonFilter = [Pokemon]()
    var isSearching = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        searchBar.delegate = self
        
        searchBar.returnKeyType = UIReturnKeyType.Done
        
        parsePokemon()
        pokemon.randomize()
        
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
        if isSearching == false {
            return pokemon.count
            
        }
        else {
            return pokemonFilter.count
            
        }
        
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let storyboard : UIStoryboard = UIStoryboard(
            name: "Main",
            bundle: nil)
        let vc:PokemonDetails = storyboard.instantiateViewControllerWithIdentifier("PokemonDetails") as! PokemonDetails
        vc.preferredContentSize = CGSizeMake(300, 300)
        vc.modalPresentationStyle = UIModalPresentationStyle.Popover
        vc.popoverPresentationController?.delegate = self
        vc.popoverPresentationController?.sourceView = self.view
        vc.popoverPresentationController?.sourceRect = CGRectMake(100, 100, 0, 0)
        vc.popoverPresentationController?.permittedArrowDirections = UIPopoverArrowDirection.init(rawValue: 0)
        self.presentViewController(vc, animated: true, completion: nil)
        
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCellWithIdentifier("PokemonCell") as? PokemonCell {
            //            let pokemon = Pokemon(name: "Test", id: indexPath.row + 1)
            let pokemon_:Pokemon!
            if isSearching == false {
                pokemon_ = pokemon[indexPath.row]
                
            }
            else {
                pokemon_ = pokemonFilter[indexPath.row]
                
            }
            
            
            cell.configureCell(pokemon_)
            return cell
        }
            
        else {
            
            return UITableViewCell()
        }
        
    }
    
    
    func searchBar(searchBar: UISearchBar, textDidChange searchText: String) {
        if searchBar.text == nil || searchBar.text == "" {
            isSearching = false
            view.endEditing(true)
            tableView.reloadData()
        }
            
        else {
            isSearching = true
            let search = searchBar.text!.lowercaseString
            
            pokemonFilter = pokemon.filter({$0.name.rangeOfString(search) != nil})
            tableView.reloadData()
            
        }
    }
    
    func searchBarSearchButtonClicked(searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showDetails" {
            let popoverViewController = segue.destinationViewController as! UIViewController
            popoverViewController.modalPresentationStyle = UIModalPresentationStyle.Popover
            popoverViewController.popoverPresentationController!.delegate = self
        }
    }
    func adaptivePresentationStyleForPresentationController(controller: UIPresentationController) -> UIModalPresentationStyle {
        return UIModalPresentationStyle.None
    }
}


