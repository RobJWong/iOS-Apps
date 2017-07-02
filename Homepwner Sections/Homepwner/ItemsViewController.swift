//
//  ItemsViewController.swift
//  Homepwner
//
//  Created by Robert Wong on 6/21/17.
//  Copyright © 2017 Robert Wong. All rights reserved.
//
//  ItemStore is a Swift base class - it does not inherit from any other class. Unlike the Item class
//  that you defined earlier, ItemStore does not require any of the behavior that NSObjects affords.
//
//  The ItemViewController will call a method on ItemStore when it wants a new Item to be created. 
//  The ItemsStore will oblige, creating the object and adding it to an array of instances of Item.

import UIKit

class ItemsViewController: UITableViewController {
    
    var itemStore: ItemStore!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Get the height of the status bar
        let statusBarHeight = UIApplication.shared.statusBarFrame.height
        
        //Makes the content appear below the status bar
        let insets = UIEdgeInsets(top: statusBarHeight, left: 0, bottom: 0, right: 0)
        tableView.contentInset = insets
        tableView.scrollIndicatorInsets = insets
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //returns to the table the number of rows based on how many Item objects there are
        return itemStore.allItems.count
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if (section == 0) {
            return ("Items lower than 50 dollars")
        }
        else {
            return ("Items higher than 50 dollars")
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //Create an instance of UITableViewCell, with default appearance
        //let cell = UITableViewCell(style: .value1, reuseIdentifier: "UITableViewCell")
        
        //Get a new or recycled cell. Recycled cells are used to reduce memeory usage for overall app performance
        let cell = tableView.dequeueReusableCell(withIdentifier: "UITableViewCell", for: indexPath)
        
        // Set the text on the cell with the description of the item that is at the nth index of items, where n = row this cell will appear in on the tableview
        let item = itemStore.allItems[indexPath.row]
        
        cell.textLabel?.text = item.name
        cell.detailTextLabel?.text = "$\(item.valueInDollars)"
        
        return cell
    }
    
}
