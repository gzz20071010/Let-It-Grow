//
//  Plant.swift
//  Let It Grow
//
//  Created by shengxiang guo on 3/30/16.
//  Copyright © 2016 shengxiang guo. All rights reserved.
//

import Foundation
import UIKit

class Plant{

    private var _deviceName:String!  //chinaflower
    private var _checkNow:String!      //0,1,2
    private var _deviceID:String!      //serial code?
    private var _date:[Date]!
    
    var deviceName: String{
        if _deviceName == nil{
            _deviceName = ""
        }
        return _deviceName
    }
    
    var deviceID: String{
        if _deviceID == nil{
            _deviceID = ""
        }
        return _deviceID
    }
    
    var checkNow: String{
        if _checkNow == nil{
            _checkNow = ""
        }
        return _checkNow
    }
    
    var date:[Date]{
        if _date == nil{
           _date = [Date]()
        }
        return _date
    }
    
    init(deviceName: String, deviceID: String, checkNow: String, date: [Date]){
        _deviceName = deviceName
        _deviceID = deviceID
        _checkNow = checkNow
        _date = date
    }
    
}
