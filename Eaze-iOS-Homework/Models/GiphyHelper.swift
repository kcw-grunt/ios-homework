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
    

    class func resultsFromGiphySearch(searchText:String) -> String {
        let client = GPHClient(apiKey: "OLokyhP3KucBC7fi7SB3sZ7iyDWK8i7x")

        let searcher = client.search(searchText) { (response, error) in
            
                if let response = response, let data = response.data, let pagination = response.pagination {
                    print(response.meta)
                    print(pagination)
                    for result in data {
                        print(result)
                    }
                } else {
                    print("No Results Found")
                }
        }
        return ""
        
    }
    
    class func loadMediaData(responseData:Any) -> Array<GPHMedia> {
        return [GPHMedia()]
    }

    
}


