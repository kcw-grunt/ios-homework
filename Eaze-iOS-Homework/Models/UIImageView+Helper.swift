//
//  UIImageViewHelper.swift
//  Eaze-iOS-Homework
//
//  Created by Kerry Washington on 1/2/18.
//  Copyright © 2018 kerrywashington. All rights reserved.
//

import UIKit


    
extension UIImageView {
    func imageFromServerURL(urlString: String) {
        
        URLSession.shared.dataTask(with: NSURL(string: urlString)! as URL, completionHandler: { (data, response, error) -> Void in
            if error != nil {
                print(error)
                return
            }
            DispatchQueue.main.async(execute: { () -> Void in
                let image = UIImage(data: data!)
                self.image = image
            })
        }).resume()
    }
    
}



