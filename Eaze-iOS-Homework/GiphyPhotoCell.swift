//
//  GiphyPhotoCell.swift
//  Eaze-iOS-Homework
//
//  Created by Kerry Washington on 1/1/18.
//  Copyright © 2018 kerrywashington. All rights reserved.
//

import UIKit
import Gifu

class GiphyPhotoCell: UICollectionViewCell {
    
    var titleLabel: UILabel = UILabel()
    var giphyImageView: UIImageView = UIImageView()
    var giphyGIFView: GIFImageView = GIFImageView()
    var image: UIImage = UIImage.init(named: "defaultCellImage")!
 
    override init(frame: CGRect) {
        super.init(frame: frame)
        giphyImageView = UIImageView()
        giphyImageView.contentMode = .scaleAspectFill
        giphyImageView.isUserInteractionEnabled = false
        giphyImageView.image = image
        contentView.addSubview(giphyImageView)
        
        giphyGIFView = GIFImageView()
        giphyGIFView.contentMode = .scaleAspectFill
        giphyGIFView.isUserInteractionEnabled = true
        contentView.addSubview(giphyGIFView)

        titleLabel = UILabel()
        contentView.addSubview(titleLabel)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        var frame = giphyImageView.frame
        frame.size.height = self.frame.size.height
        frame.size.width = self.frame.size.width
        frame.origin.x = 0
        frame.origin.y = 0
        giphyImageView.frame = frame
        giphyGIFView.frame = frame
        
        let label = titleLabel
        let labelHeight = CGFloat(18.0)
        label.frame = CGRect.init(x: 0, y: self.frame.size.height-labelHeight, width: self.frame.size.width, height: labelHeight)
        label.textColor = .white
        label.backgroundColor = .clear
        label.font = UIFont.init(name: "Arial", size: 8.0)
        label.textAlignment = .center
        titleLabel = label
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
  
}

