//
//  Date.swift
//  Let It Grow
//
//  Created by shengxiang guo on 4/8/16.
//  Copyright © 2016 shengxiang guo. All rights reserved.
//

import Foundation

class Date{
    
    private var _date:String!  //2016-Apr-01
    private var _aggregate:[String]!      //0 LIGHT,1,2,4,5
    private var _initial:[String]!      //0 LIGHT,1,2,4,5
    
    var date: String{
        if _date == nil{
            _date = ""
        }
        return _date
    }
    
    var aggregate: [String]{
        if _aggregate == nil{
            _aggregate = [""]
        }
        return _aggregate
    }
    
    var initial: [String]{
        if _initial == nil{
            _initial = [""]
        }
        return _initial
    }
    
    init(date: String){
        self._date = ""
        self._aggregate = [""]
        self._initial = [""]
    }
    
    init(date: String, aggregate: [String], initial:[String]){
        _date = date
        _aggregate = aggregate
        _initial = initial
    }
}
