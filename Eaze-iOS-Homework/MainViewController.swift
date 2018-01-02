//
//  MainViewController.swift
//  Eaze-iOS-Homework
//
//  Created by Kerry Washington on 12/31/17.
//  Copyright © 2017 kerrywashington. All rights reserved.
//

import UIKit

let headerInset = HWHelper.headerGivenIdiom()
class MainViewController: UIViewController, UISearchResultsUpdating, UISearchBarDelegate {

    var searchController: UISearchController!
    var searchBar: UISearchBar!
    var filterString: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Kerry's Giphy Picker"
        setupSearchController()
        
       let containerView = UIView()
        containerView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(containerView)
        NSLayoutConstraint.activate([
            containerView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            containerView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            containerView.topAnchor.constraint(equalTo: view.topAnchor, constant: 144),
            containerView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -10),
            ])
        
        // add child view controller view to container
        let collectionViewController = GPHCollectionViewController()
        addChildViewController(collectionViewController)
        collectionViewController.view.translatesAutoresizingMaskIntoConstraints = false
        containerView.addSubview(collectionViewController.view)
        NSLayoutConstraint.activate([
            collectionViewController.view.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            collectionViewController.view.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            collectionViewController.view.topAnchor.constraint(equalTo: containerView.topAnchor),
            collectionViewController.view.bottomAnchor.constraint(equalTo: containerView.bottomAnchor)
            ])

        collectionViewController.didMove(toParentViewController: self)
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
        searchBar.delegate = self

        searchBar.placeholder = "Find a giphy..."
        for subView in searchBar.subviews {
            if subView .isKind(of: UITextField.self) {
                let tf = subView as! UITextField
                    tf.returnKeyType = .search
            }
        }
        
        //Customize Header
        let setView = UIView.init(frame: CGRect(x: 0, y: headerInset, width: self.view.frame.width, height: headerInset))
        setView.addSubview(searchBar)
        self.view.addSubview(setView)
    }
    
    // MARK: - Search Delegate
    func updateSearchResults(for searchController: UISearchController) {
       // print(searchController.searchBar.text!)
        
    }
    
    func updateSearchResultsForSearchController(searchController: UISearchController) {
        if !searchController.isActive {
            return
        }
        
        filterString = searchController.searchBar.text
        print(filterString)
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        print(searchBar.text!)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
