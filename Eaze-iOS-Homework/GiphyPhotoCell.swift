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
 
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureViews()

        giphyImageView = UIImageView()
        giphyImageView.contentMode = .scaleAspectFill
        giphyImageView.isUserInteractionEnabled = false
        contentView.addSubview(giphyImageView)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        var frame = giphyImageView.frame
        frame.size.height = self.frame.size.height
        frame.size.width = self.frame.size.width
        frame.origin.x = 0
        frame.origin.y = 0
        giphyImageView.frame = frame
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureViews() {
        giphyImageView = UIImageView()
        giphyImageView.image = image
        giphyImageView.frame = CGRect.init(x: 0, y: 0, width: self.frame.width, height: self.frame.height)
        giphyImageView.backgroundColor = .red
        self.addSubview(giphyImageView)
    }
}

