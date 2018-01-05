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


let headerInset = HWHelper.headerGivenIdiom()
class MainViewController: UIViewController, UISearchResultsUpdating, UISearchBarDelegate {

    var searchController: UISearchController!
    var collectionViewController: GPHCollectionViewController!
    var searchBar: UISearchBar!
    var searchButton: TogglingButton!
    var giphyClient: GPHClient!
    var reachability: Reachability!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Kerry's Giphy Finder"
        searchButton = TogglingButton.init(type: .custom)
        searchButton.frame = CGRect.init(x: 0, y: 0, width: 20, height: 20)
        searchButton.layer.cornerRadius = 10
        searchButton.setTitleColor(.black, for: .normal)
        searchButton.addTarget(self, action: #selector(MainViewController.toggleSearchValue), for: .touchUpInside)
        
        let bbi = UIBarButtonItem.init(customView: searchButton)
        self.navigationItem.rightBarButtonItem = bbi
        giphyClient = GPHClient(apiKey: "OLokyhP3KucBC7fi7SB3sZ7iyDWK8i7x")
        setupSearchController()
        setupContainerView()
        self.reachability = Reachability()
    }
 
    
    func setupContainerView() {
        let containerView = UIView()
        containerView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(containerView)
        NSLayoutConstraint.activate([
            containerView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            containerView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            containerView.topAnchor.constraint(equalTo: view.topAnchor, constant: 120),
            containerView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0),
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
        if Reachability.isConnectedToNetwork() {
 
        let limitCount = searchButton.toggleArray[searchButton.toggleIncr]
            
            giphyClient.search(searchBar.text!,
                               media:.gif,
                               offset:0,
                               limit:limitCount,
                               rating:.ratedR,
                               lang:.english) { (response, error) in
                                    if let error = error as NSError? {
                                        self.genericAlertOkController(title: "Error looking for Giphys!", message: "Error: \(error.localizedDescription)")
                                    }
                                
                                    if let response = response,
                                        let data = response.data,
                                        let filledArray = GiphyHelper.loadMediaData(responseData:data) as? [MyGiphySummaryObject],
                                        let pagination = response.pagination {
                                        
                                        print(response.pagination?.description)
                                            NotificationCenter.default.post(name: .giphySearchResultsReceived, object: nil , userInfo: ["filledArray": filledArray])
                                        } else {
                                            self.genericAlertOkController(title:"No Giphys Found!", message: "Please search later. Or, change your query")
                                        }
                                }
            } else {
                               self.genericAlertOkController(title: "No Internet!", message: "Please connect to the Internet to get the coolest Giphys.")
            }
    }

    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {

    }
    
    
   @objc func toggleSearchValue(sender:TogglingButton){
    
        if sender.toggleIncr < sender.toggleArray.count-1 {
            sender.toggleIncr += 1
        }else{
            sender.toggleIncr = 0
        }
    
     print(sender.toggleIncr)
        searchButton.setTitle("\(sender.toggleArray[sender.toggleIncr])", for: .normal)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func genericAlertOkController(title:String, message:String){
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .cancel)
        alertController.addAction(okAction)
        self.present(alertController, animated: true, completion: nil)
    }

}
