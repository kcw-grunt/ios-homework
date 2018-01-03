//
//  GiphyPhotoCell.swift
//  Eaze-iOS-Homework
//
//  Created by Kerry Washington on 1/1/18.
//  Copyright © 2018 kerrywashington. All rights reserved.
//

import UIKit
import Gifu

class GiphyPhotoCell: UICollectionViewCell, UIGestureRecognizerDelegate {
    
    var titleLabel: UILabel
    var giphyImageView: UIImageView
    var giphyGIFView: GIFImageView
    var giphySmallUrl:String = ""
    var image: UIImage = UIImage.init(named: "defaultCellImage")!
 
    override init(frame: CGRect) {
        giphyImageView = UIImageView()
        giphyImageView.contentMode = .scaleAspectFit
        giphyImageView.isUserInteractionEnabled = false
        giphyImageView.image = image
        
        giphyGIFView = GIFImageView()
        giphyGIFView.contentMode = .scaleAspectFit
        giphyGIFView.isUserInteractionEnabled = true

        titleLabel = UILabel()
        super.init(frame: frame)
        contentView.addSubview(giphyImageView)
        contentView.addSubview(giphyGIFView)
        contentView.addSubview(titleLabel)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        var frame = giphyGIFView.frame
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
    
    
    public func animate(url:String) {
        print(url)
        if !url.isEmpty {
            self.giphyGIFView.animate(withGIFURL: URL.init(string: url)!)
        } else {
            
        }
        
    }
     
    
//    override var isSelected: Bool{
//        didSet{
//            if self.isSelected
//            {
//                self.transform = CGAffineTransform(scaleX: 1.1, y: 1.1)
//                self.contentView.backgroundColor = UIColor.red
//              //  self.tickImageView.isHidden = false
//            }
//            else
//            {
//                self.transform = CGAffineTransform.identity
//                self.contentView.backgroundColor = UIColor.gray
//               // self.tickImageView.isHidden = true
//            }
//        }
//    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
  
}

