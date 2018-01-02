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
    var giphyArray = [GPHMedia()]
    fileprivate let itemsPerRow: CGFloat = 3

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
        
        NotificationCenter.default.addObserver(forName: .giphySearchResultsReceived, object: nil, queue: .main) {[weak self] (notification) in
            //self?.handleAssetTagNamingProcess(notification: notification)
            //Refresh CollectionView
        }
 
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
 
    // MARK: UICollectionViewDataSource
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return giphyArray.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! GiphyPhotoCell
        
       //let giphyImage = photoForIndexPath(indexPath: indexPath)

        /*
         //RESEARCH: Does this adopt Giphy class
         cell.giphyImageView.image = UIImage.animatedImage(with: <#T##[UIImage]#>, duration: <#T##TimeInterval#>)
        cell.giphyImageView.image = UIImage.animatedImageNamed(<#T##name: String##String#>, duration: <#T##TimeInterval#>)
         */
        cell.giphyImageView.image = UIImage.init(named: "defaultCellImage")
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

}
