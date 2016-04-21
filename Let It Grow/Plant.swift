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
    private var _lastChecked:String!
    private var _lastWatered:String!
    private var _needsWater:Int!
    
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
    
    var lastChecked: String{
        if _lastChecked == nil{
            _lastChecked = ""
        }
        return _lastChecked
    }

    var lastWatered: String{
        if _lastWatered == nil{
            _lastWatered = ""
        }
        return _lastWatered
    }

    var needsWater: Int{
        if _needsWater == nil{
            _needsWater = -1
        }
        return _needsWater
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
