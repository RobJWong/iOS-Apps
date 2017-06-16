//
//  TableViewController.swift
//  SearchApp
//
//  Created by Robert Wong on 6/16/17.
//  Copyright © 2017 Kasey Schlaudt. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController, UISearchResultsUpdating {
    
    var ingredients = ["Chicken Breast Without Bone", "Chicken Thigh With Bone", "Garlic", "Soy Sauce",
                       "Parsley", "Onion", "Egg", "Tofu", "Penne"]
    var filteredIngredients = [String]()
    
    var searchController: UISearchController!
    var resultsController = UITableViewController()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.resultsController.tableView.dataSource = self
        self.resultsController.tableView.delegate = self
        
        self.searchController = UISearchController(searchResultsController: self.resultsController)
        self.tableView.tableHeaderView = self.searchController.searchBar
        self.searchController.searchResultsUpdater = self
        
        self.searchController.dimsBackgroundDuringPresentation = false
        definesPresentationContext = true

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    
    func updateSearchResults(for searchController: UISearchController) {
        //filter through the ingredients array
        self.filteredIngredients =  self.ingredients.filter { (ingredientName:String) -> Bool in
            if ingredientName.lowercased().contains(self.searchController.searchBar.text!.lowercased()) {
                return true
            }
            else {
                return false
            }
        }
        // update the table view
        self.resultsController.tableView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        if tableView == self.tableView{
            return self.ingredients.count
        }
        else {
            return self.filteredIngredients.count
        }
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        if tableView == self.tableView {
            //cell.textLabel?.text = self.ingredients[indexPath.row]
            print("empty")
        }
        else {
            cell.textLabel?.text = self.filteredIngredients[indexPath.row]
        }

        return cell
    }

  
}
