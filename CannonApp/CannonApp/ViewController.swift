//
//  ViewController.swift
//  CannonApp
//
//  Created by Robert Wong on 6/13/17.
//  Copyright © 2017 Robert Wong. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UISearchBarDelegate {

    let searchBar = UISearchBar()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        func createSearchBar() {
            searchBar.showsCancelButton = false
            searchBar.placeholder = "Search Ingredients"
            searchBar.delegate = self
            self.navigationItem.titleView = searchBar
            
        }
        
         createSearchBar()
        // Do any additional setup after loading the view, typically from a nib.
    }


}

