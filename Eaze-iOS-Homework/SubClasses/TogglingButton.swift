//
//  TogglingButton.swift
//  Eaze-iOS-Homework
//
//  Created by Kerry Washington on 1/4/18.
//  Copyright © 2018 kerrywashington. All rights reserved.
//

import UIKit

class TogglingButton: UIButton {

    let toggleArray = [10,25,50,250]
    var toggleValue: Int = 10
    var toggleIncr: Int = 0
    override var canBecomeFirstResponder: Bool {
        return true
    }
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        sharedInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        sharedInit()
    }
    
    func sharedInit() {
        isUserInteractionEnabled = true
        self.titleLabel?.font = UIFont.init(name: "Arial-BoldMT", size: 12.0)
        self.layer.borderColor = UIColor.black.cgColor
        self.layer.borderWidth = 1.0
        self.setTitle("\(self.toggleValue)", for: .normal)
    }

}
