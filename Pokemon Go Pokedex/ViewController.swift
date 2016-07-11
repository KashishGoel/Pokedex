//
//  ViewController.swift
//  Pokemon Go Pokedex
//
//  Created by Kashish Goel on 2016-07-10.
//  Copyright © 2016 Kashish Goel. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var tableView:UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
    
        tableView.delegate = self
        tableView.dataSource = self
        
        // Do any additional setup after loading the view, typically from a nib.
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
            var pokemon = Pokemon(name: "Test", id: indexPath.row + 1)
            
            cell.configureCell(pokemon)
        return cell
        }
        
        else {
        
        return UITableViewCell()
        }
        
    }
}


