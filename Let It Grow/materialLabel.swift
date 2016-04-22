//
//  materialLabel.swift
//  Let It Grow
//
//  Created by shengxiang guo on 4/22/16.
//  Copyright © 2016 shengxiang guo. All rights reserved.
//
import UIKit
import Foundation

class materialLabel: UILabel {
    
    override func awakeFromNib() {
        layer.masksToBounds = false;
        layer.cornerRadius = 2.0
        layer.shadowColor = UIColor(red: SHADOW_COLOR, green: SHADOW_COLOR, blue: SHADOW_COLOR, alpha: 0.5).CGColor
        layer.shadowOpacity = 0.8
        layer.shadowRadius = 5.0
        layer.shadowOffset = CGSizeMake(0.0, 2.0)
        self.clipsToBounds = false

    }
    
}
