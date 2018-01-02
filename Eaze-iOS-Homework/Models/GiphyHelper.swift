//
//  GiphyHelper.swift
//  Eaze-iOS-Homework
//
//  Created by Kerry Washington on 1/1/18.
//  Copyright © 2018 kerrywashington. All rights reserved.
//

import UIKit
import GiphyCoreSDK
class GiphyHelper: NSObject {
    
    public func arrayOfMediaFromGiphySearch(searchText:String) -> [GPHMedia] {
        let client = GPHClient(apiKey: "OLokyhP3KucBC7fi7SB3sZ7iyDWK8i7x")
        let defaultMedia = [GPHMedia()]
        let  test = client.search(searchText) { (response, error) in
            
                if let response = response, let data = response.data, let pagination = response.pagination {
                    self.loadMediaData(responseData: data)
                } else {
                    print("No Results Found")
                }
        }
        return defaultMedia
        
    }
    
    func loadMediaData(responseData:[GPHMedia]) -> Array<GPHMedia> {
        for gphmedia in responseData {
            print(gphmedia.bitlyGifUrl)
            print(gphmedia.url)
            print(gphmedia.caption)
            print(gphmedia.contentUrl)
            print(gphmedia.createDate)
            print(gphmedia.description)
            print(gphmedia.embedUrl)
            print(gphmedia.jsonRepresentation)
            print(gphmedia.title)
            print(gphmedia.trendingDate)
            print("\n")
            print("NEXT MEDIA")
            
        }
        
        NotificationCenter.default.post(name: .giphySearchResultsReceived, object: nil)

        
        return [GPHMedia()]
    }

    
}


