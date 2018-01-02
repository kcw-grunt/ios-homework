//
//  MyGiphySummaryObject.swift
//  Eaze-iOS-Homework
//
//  Created by Kerry Washington on 1/1/18.
//  Copyright © 2018 kerrywashington. All rights reserved.
//

import Foundation

class MyGiphySummaryObject {
    var title: String = ""
    var url: String
    var fixedHeightSmallUrl: String  = ""
    var fixedHeightSmallStillUrl: String = ""
    var loopingUrl: String = ""
    var originalUrl: String = ""
    var height: Float = 0.0
    
    init(baseUrl:String) {
        self.url = baseUrl
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
}
