//
//  GiphyHelper.swift
//  Eaze-iOS-Homework
//
//  Created by Kerry Washington on 1/1/18.
//  Copyright © 2018 kerrywashington. All rights reserved.
//

import UIKit
import GiphyCoreSDK
import Foundation

class GiphyHelper {
 
   class func loadMediaData(responseData:[GPHMedia]) -> Array<MyGiphySummaryObject> {
        var filledArray : Array<MyGiphySummaryObject> = []
            for gphmedia in responseData {
                let obj = GiphyHelper.parseGiphyMedia(object: gphmedia.jsonRepresentation!)
                filledArray.append(obj)
            }
        return filledArray
    }
    
    class func parseGiphyMedia(object: GPHJSONObject) -> MyGiphySummaryObject {
        
        var  filledObject = MyGiphySummaryObject(baseUrl:"NOURL")
        
        if let url = object["url"] as? String,
            let title = object["title"] as? String,
            let images = object["images"] as? [String:Any],
            let fixedHeightSmall = images["fixed_height_small"] as? [String:Any],
            let height = fixedHeightSmall["height"] as? String,
            let fixedHeightSmallStill = images["fixed_height_small_still"] as? [String:Any],
            let orig = images["original"] as? [String:Any],
            let origH = orig["height"] as? String,
            let origW = orig["width"] as? String,
            let size = orig["size"] as? String {
                let obj = MyGiphySummaryObject(baseUrl:url)
                obj.title = title
                obj.url = url
                obj.fixedHeightSmallUrl = fixedHeightSmall["url"] as! String
                obj.fixedHeightSmallStillUrl = fixedHeightSmallStill["url"] as! String
                obj.originalUrl = orig["url"] as! String
                obj.originalHeight =  Float(origH) ?? 0.0
                obj.originalWidth = Float(origW) ?? 0.0
                obj.originalFileSize = Int(size) ?? 0
                obj.height = Float(height) ?? 0.0
                filledObject = obj
        }
        return filledObject
    }
}


//        frames = 21;
//height = 360;
//mp4 = "https://media1.giphy.com/media/SQiQu6lbG8bn2/giphy.mp4";
//"mp4_size" = 30490;
//size = 939352;
//url = "https://media1.giphy.com/media/SQiQu6lbG8bn2/giphy.gif";
//webp = "https://media1.giphy.com/media/SQiQu6lbG8bn2/giphy.webp";
//"webp_size" = 656254;
//width = 470;

