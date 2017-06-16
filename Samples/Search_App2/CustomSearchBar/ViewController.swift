//
//  ViewController.swift
//  CustomSearchBar
//
//  Created by Gabriel Theodoropoulos on 8/9/15.
//  Copyright (c) 2015 Appcoda. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchResultsUpdating, UISearchBarDelegate {

    @IBOutlet weak var tblSearchResults: UITableView!
    
    var searchController: UISearchController!
    var dataArray = [String]()
    //contains contents of the countries, acts as a datasource when no search is performed
    var filteredArray = [String]()
    //used as a datasource when the user starts to search as it will only match with what is matched
    var shouldShowSearchResults = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadListOfCountries()
        configureSearchController()
        // Do any additional setup after loading the view, typically from a nib.
        
        tblSearchResults.delegate = self
        tblSearchResults.dataSource = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    // MARK: UITableView Delegate and Datasource functions
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        shouldShowSearchResults = true
        tblSearchResults.reloadData()
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        shouldShowSearchResults = false
        tblSearchResults.reloadData()
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        if !shouldShowSearchResults {
            shouldShowSearchResults = true
            tblSearchResults.reloadData()
        }
        searchController.searchBar.resignFirstResponder()
    }
    
    func updateSearchResults(for searchController: UISearchController) {
        let searchString = searchController.searchBar.text
        
//        filteredArray = dataArray.filter({(country) -> Bool in
//            let countryText: NSString = country as NSString
        filteredArray = dataArray.filter({(country) -> Bool in
            let countryText: String = country
        
            return ((countryText.range(of: searchString!, options: String.CompareOptions.caseInsensitive) != nil))
            //return (countryText.rangeOfString(searchString, options: NSStringCompareOptions.CaseInsensitiveSearch).location) !NSNotFound
        })
        tblSearchResults.reloadData()
    }
    
    func configureSearchController(){
        searchController = UISearchController(searchResultsController: nil)
        searchController.searchResultsUpdater = self
        searchController.dimsBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Search here..."
        searchController.searchBar.delegate = self
        searchController.searchBar.sizeToFit()
        
        tblSearchResults.tableHeaderView = searchController.searchBar
    }
    
    func loadListOfCountries () {
        //let pathToFile = Bundle.mainBundle().pathForResource("countries", ofType: "txt")
        let pathToFile = Bundle.main.path(forResource: "countries", ofType: "txt")
        if let path = pathToFile {
            do {
                let countriesString = try String(contentsOfFile: path, encoding: String.Encoding.utf8)
                dataArray = countriesString.components(separatedBy: "\n")
                tblSearchResults.reloadData()
            }
            catch let error {
                print ("error occured \(error)")
            }
            //let countriesString = String(contentsOfFile: path, encoding: NSUTF8StringEncoding, error: nil)
            //dataArray = countriesString.componentsSeparatedByString("\n")
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if shouldShowSearchResults {
            return filteredArray.count
        }
        else {
            return dataArray.count
        }
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "idCell", for: indexPath)
        if shouldShowSearchResults {
            cell.textLabel?.text = filteredArray[indexPath.row]
        }
        else {
            cell.textLabel?.text = dataArray[indexPath.row]
        }
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60.0
    }
}

