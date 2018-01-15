//
//  GPHCollectionViewController.swift
//  Eaze-iOS-Homework
//
//  Created by Kerry Washington on 12/31/17.
//  Copyright © 2017 kerrywashington. All rights reserved.
//

import UIKit
import GiphyCoreSDK

private let reuseIdentifier = "giphyPhotoCell"
fileprivate let dumbInset: CGFloat = 20


class GPHCollectionViewController: UIViewController,UICollectionViewDelegateFlowLayout,UICollectionViewDelegate,UICollectionViewDataSource {

    
    var giphyCollectionView: UICollectionView!
    var giphyArray = [MyGiphySummaryObject]()
    var filterView: UIView!

    fileprivate let itemsPerRow: CGFloat = 4

    override func viewDidLoad() {
        super.viewDidLoad()
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        layout.itemSize = CGSize(width: 100, height: 100)
        giphyCollectionView = UICollectionView(frame: self.view.frame, collectionViewLayout: layout)
        giphyCollectionView.dataSource = self
        giphyCollectionView.delegate = self
        giphyCollectionView.register(GiphyPhotoCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        self.view.addSubview(giphyCollectionView)
        
 
        NotificationCenter.default.addObserver(forName: .giphySearchResultsReceived, object: nil, queue: .main) { [weak self] (notification) in
            self?.handleGiphyDataNotification(notification: notification)
        }
        
        NotificationCenter.default.addObserver(forName: .clearGiphysCollectionView, object: nil, queue: .main) { [weak self] (notification) in
            self?.handleClearGiphyDataNotification(notification: notification)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
 
    
    //NSNotification
    
    func handleGiphyDataNotification(notification:Notification) {
        if let data = notification.userInfo as? [String:Any], let array = data["filledArray"] as? [MyGiphySummaryObject] {
            if array.count > 5 {
                self.giphyArray = array
                self.giphyCollectionView.reloadData()
            } else {
                self.genericAlertOkController(title: "Misspalling?", message: "Your search results are sparse. A more focused search is recommneded")
            }
        }
    }
    
    func handleClearGiphyDataNotification(notification:Notification) {
        self.giphyArray = []
        self.giphyCollectionView.reloadData()
    }
    
    
    // MARK: UICollectionViewDataSource
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return giphyArray.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        var cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! GiphyPhotoCell
        let giphyObj = self.giphyArray[indexPath.row] as? MyGiphySummaryObject
        configureCell(cell:cell, objData:giphyObj!)
        return cell
    }

    // MARK: UICollectionViewDelegate
 
    func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
            if let cell = collectionView.cellForItem(at: indexPath) as? GiphyPhotoCell {
                
                let detailViewController = DetailViewController()
                let selectedObject = self.giphyArray[indexPath.row]
                detailViewController.selectedObject = selectedObject
                detailViewController.largeGIPHYImageView = cell.giphyGIFView
                detailViewController.modalTransitionStyle = .crossDissolve
                
                self.present(detailViewController, animated: true, completion: nil)
                
            } else {
            }
    }
    
    func configureCell(cell:GiphyPhotoCell, objData:MyGiphySummaryObject) {
 
        URLSession.shared.dataTask(with: NSURL(string: objData.fixedHeightSmallStillUrl)! as URL, completionHandler: { (data, response, error) -> Void in
                if error != nil {
                    print(error)
                    self.genericAlertOkController(title: "Downloading Still Error", message: "Error getting still: \(error!.localizedDescription)")
                    return
                }
                DispatchQueue.main.async(execute: { () -> Void in
                    let image = UIImage(data: data!)
                    cell.giphyImageView.image = image
                })
            }).resume()
        
        cell.animate(url:objData.fixedHeightSmallUrl)
        cell.titleLabel.text = objData.title
        if cell.giphyGIFView.isAnimating {
            cell.giphyImageView.isHidden = true
        }
    }
    
    
    func genericAlertOkController(title:String, message:String){
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .cancel)
        alertController.addAction(okAction)
        self.present(alertController, animated: true, completion: nil)
    }
}

