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
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
 
    
    //NSNotification
    
    func handleGiphyDataNotification(notification:Notification) {
        if let data = notification.userInfo as? [String:Any], let array = data["filledArray"] as? [MyGiphySummaryObject] {
            self.giphyArray = array
            self.giphyCollectionView.reloadData()
        }
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
    
 
    func configureCell(cell:GiphyPhotoCell, objData:MyGiphySummaryObject) {
 
        URLSession.shared.dataTask(with: NSURL(string: objData.fixedHeightSmallStillUrl)! as URL, completionHandler: { (data, response, error) -> Void in
                if error != nil {
                    print(error)
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

}
