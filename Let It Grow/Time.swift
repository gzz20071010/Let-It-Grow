//
//  Time.swift
//  Let It Grow
//
//  Created by shengxiang guo on 4/21/16.
//  Copyright © 2016 shengxiang guo. All rights reserved.
//

import Foundation

class Time{
    private var _time:String!  //10:37:32pm
    private var _data:Dictionary<String, AnyObject>! //["SENSOR_1": 0, "ROOM_HUMIDITY": 37.3, "ROOM_HEAT_INDEX": 22.77, "LIGHT_SENSOR": 1221, "SOIL_TEMPERATURE": 0, "SENSOR_3": 0, "ROOM_TEMPERATURE": 23.4, "SENSOR_2": 0]
    var time: String{
        if _time == nil{
            _time = ""
        }
        return _time
    }
    
    var data: Dictionary<String,AnyObject>{
        if _data == nil{
            _data = Dictionary<String,AnyObject>()
        }
        return _data
    }
    
    init(time:String, data:Dictionary<String, AnyObject>){
        _time = time
        _data = data
    }
    
    
}