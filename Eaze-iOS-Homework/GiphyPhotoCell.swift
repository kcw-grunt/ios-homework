//
//  GiphyPhotoCell.swift
//  Eaze-iOS-Homework
//
//  Created by Kerry Washington on 1/1/18.
//  Copyright © 2018 kerrywashington. All rights reserved.
//

import UIKit

class GiphyPhotoCell: UICollectionViewCell {
    
    var giphyImageView: UIImageView = UIImageView()
    var image: UIImage = UIImage.init(named: "defaultCellImage")!
    init() {
        super.init(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        configureViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented the way")
    }
    
    func configureViews() {
        giphyImageView = UIImageView()
        giphyImageView.image = image
        giphyImageView.frame = CGRect.init(x: 0, y: 0, width: self.frame.width, height: self.frame.height)
        giphyImageView.backgroundColor = .red
        self.addSubview(giphyImageView)
    }
}

