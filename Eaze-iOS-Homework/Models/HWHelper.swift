//
//  HWHelper.swift
//  Eaze-iOS-Homework
//
//  Created by Kerry Washington on 1/1/18.
//  Copyright © 2018 kerrywashington. All rights reserved.
//

import UIKit

class HWHelper: NSObject {
    
    public class func headerGivenIdiom() -> CGFloat {
        if UIDevice().userInterfaceIdiom == .phone {
            switch UIScreen.main.nativeBounds.height {
            case 1136:
                return 64.0 //print("iPhone 5 or 5S or 5C")
            case 1334:
                return 64.0 //print("iPhone 6/6S/7/8")
            case 2208:
                return 64.0 //print("iPhone 6+/6S+/7+/8+")
            case 2436:
                return 88.0 //print("iPhone X")
            default:
                return 4.0 //print("unknown")
            }
        }
        return 0.0
    }
    


}
