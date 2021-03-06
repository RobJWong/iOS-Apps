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
    
    @IBAction func addNewItem(_ sender: UIButton) {
        
//        //Make a new index path for the 0th section, last row
//        let lastRow = tableView.numberOfRows(inSection: 0)
//        let indexPath = IndexPath(row: lastRow, section: 0)
//        
//        //Insert this new row into the table
//        tableView.insertRows(at: [indexPath], with: .automatic)
        
        //Create a new item and add it to store
        let newItem = itemStore.createItem()
        
        //Figure out where that item is in the array
        if let index = itemStore.allItems.index(of: newItem) {
            let indexPath = IndexPath(row: index, section: 0)
            
            //Insert this row into the table
            tableView.insertRows(at: [indexPath], with: .automatic)
        }
    }
    
    @IBAction func toggleEditingMode(_ sender: UIButton) {
        
        //If you are currently in editing mode
        if isEditing {
            //Change text of button to inform user of state
            sender.setTitle("Edit", for: .normal)
            
            //Turn off editing mode
            setEditing(false, animated: true)
        } else {
            //Change text of button to inform user of state
            sender.setTitle("Done", for: .normal)
            
            //Enter editing mode
            setEditing(true, animated: true)
        }
        
    }
    
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
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        //If the table view is asking to commit a delete command...
        if editingStyle == .delete {
            let item = itemStore.allItems[indexPath.row]
            //Remove the item from the store
            itemStore.removeItem(item)
            
            //Also remove the row from the table view with an animation
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
    
}
