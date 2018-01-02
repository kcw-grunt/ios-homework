//
//  MainViewController.swift
//  Eaze-iOS-Homework
//
//  Created by Kerry Washington on 12/31/17.
//  Copyright © 2017 kerrywashington. All rights reserved.
//

import UIKit
import GiphyCoreSDK
import Gifu
import SwiftyJSON


let headerInset = HWHelper.headerGivenIdiom()
class MainViewController: UIViewController, UISearchResultsUpdating, UISearchBarDelegate {

    var searchController: UISearchController!
    var collectionViewController: GPHCollectionViewController!
    var searchBar: UISearchBar!
    var giphyClient: GPHClient!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Kerry's Giphy Picker"
        
        giphyClient = GPHClient(apiKey: "OLokyhP3KucBC7fi7SB3sZ7iyDWK8i7x")
        
        setupSearchController()
        setupContainerView()
    }
 
    
    func setupContainerView() {
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
        collectionViewController = GPHCollectionViewController()
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
        
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
 
        giphyClient.search(searchBar.text!) { (response, error) in
            if let error = error as NSError? {
                // Do what you want with the error
            }
            if let response = response,
                let data = response.data as? [GPHMedia],
                let filledArray = GiphyHelper.loadMediaData(responseData:data) as? [MyGiphySummaryObject],
                let pagination = response.pagination {
                    NotificationCenter.default.post(name: .giphySearchResultsReceived, object: nil , userInfo: ["filledArray": filledArray])
                } else {
                print("No Results Found")
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
