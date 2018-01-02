//
//  GPHCollectionViewController.swift
//  Eaze-iOS-Homework
//
//  Created by Kerry Washington on 12/31/17.
//  Copyright © 2017 kerrywashington. All rights reserved.
//

import UIKit

private let reuseIdentifier = "giphyPhotoCell"
fileprivate let dumbInset: CGFloat = 20


class GPHCollectionViewController: UIViewController,UICollectionViewDelegateFlowLayout,UICollectionViewDelegate,UICollectionViewDataSource {

    
    var giphyCollectionView: UICollectionView!
    fileprivate let itemsPerRow: CGFloat = 3

    override func viewDidLoad() {
        super.viewDidLoad()
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        layout.itemSize = CGSize(width: 100, height: 100)
        giphyCollectionView = UICollectionView(frame: self.view.frame, collectionViewLayout: layout)
        giphyCollectionView.dataSource = self
        giphyCollectionView.delegate = self
        giphyCollectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        giphyCollectionView.backgroundColor = .red
        self.view.addSubview(giphyCollectionView)

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Do any additional setup after loading the view.
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
        return 1
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! UICollectionViewCell
        cell.backgroundColor = UIColor.green
        /*
         //RESEARCH: Does this adopt Giphy class
         cell.giphyImageView.image = UIImage.animatedImage(with: <#T##[UIImage]#>, duration: <#T##TimeInterval#>)
        cell.giphyImageView.image = UIImage.animatedImageNamed(<#T##name: String##String#>, duration: <#T##TimeInterval#>)
         */
        //cell.giphyImageView.image = UIImage.init(named: "defaultCellImage")
        return cell
    }

    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }
    */

}
