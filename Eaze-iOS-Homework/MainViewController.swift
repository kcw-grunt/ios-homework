//
//  MainViewController.swift
//  Eaze-iOS-Homework
//
//  Created by Kerry Washington on 12/31/17.
//  Copyright © 2017 kerrywashington. All rights reserved.
//

import UIKit

let headerInset = HWHelper.headerGivenIdiom()

class MainViewController: UIViewController, UISearchResultsUpdating {

    var searchController: UISearchController!
    var searchBar: UISearchBar!
    var filterString: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Kerry's Giphy Picker"
       setupSearchController()
       
        
 
        
    }
 
    
    func setupSearchController() {
        
        searchController = UISearchController(searchResultsController: nil)
        searchController.searchResultsUpdater = self
        searchController.dimsBackgroundDuringPresentation = false
        searchController.searchBar.sizeToFit()
        definesPresentationContext = true

        //Customize Search Bar
        searchBar = UISearchBar.init(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: 0))
        searchBar = searchController.searchBar
        searchBar.placeholder = "Find a giphy..."
        
        let setView = UIView.init(frame: CGRect(x: 0, y: headerInset, width: self.view.frame.width, height: headerInset))
        setView.addSubview(searchBar)
       // setView.translatesAutoresizingMaskIntoConstraints = false

        self.view.addSubview(setView)
    }
    
    // MARK: - Search Delegate

    func updateSearchResults(for searchController: UISearchController) {
        print(searchController.searchBar)
        
    }
    
    func updateSearchResultsForSearchController(searchController: UISearchController) {
        if !searchController.isActive {
            return
        }
        
        filterString = searchController.searchBar.text
        print(filterString)
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
