//
//  Util.swift
//  Let It Grow
//
//  Created by shengxiang guo on 2/11/16.
//  Copyright © 2016 shengxiang guo. All rights reserved.
//

import Firebase
import Foundation


var UID:String!
var USERNAME:String!
let SHADOW_COLOR: CGFloat = 157.0/255.0

let ref = Firebase(url: "https://letitgrow.firebaseio.com")

func findLatestDate(plant:Plant)->Int{
    var tempMonth = 0
    var tempDay = 0
    var parsedDate = [Int]()
    var latestDateIndex = -1
    
    for (index, element) in plant.date.enumerate(){
        parsedDate = parseDateString(element.date)
        if parsedDate[0]>tempMonth {
            tempMonth = parsedDate[0]
            tempDay = parsedDate[1]
            latestDateIndex = index
        }else if parsedDate[0] == tempMonth{
            if parsedDate[1]>tempDay{
                tempMonth = parsedDate[0]
                tempDay = parsedDate[1]
                latestDateIndex = index
            }
        }
    }
    
    return latestDateIndex
}

func findLatestTime(plant:Plant)->Int{
    var tempHr = -1
    var tempMin = -1
    var tempSec = -1
    var parsedTime = [Int]()
    var latestDateIndex = -1
    
    for(index,element) in plant.date[findLatestDate(plant)].time.enumerate(){
        parsedTime = parseTimeString(element.time)
        if parsedTime[0]>tempHr{
            tempHr = parsedTime[0]
            tempMin = parsedTime[1]
            tempSec = parsedTime[2]
            latestDateIndex = index
        }else if parsedTime[0] == tempHr{
            if parsedTime[1] > tempMin{
                tempHr = parsedTime[0]
                tempMin = parsedTime[1]
                tempSec = parsedTime[2]
                latestDateIndex = index
            }else if parsedTime[1] == tempMin{
                if parsedTime[2]>tempSec{
                    tempHr = parsedTime[0]
                    tempMin = parsedTime[1]
                    tempSec = parsedTime[2]
                    latestDateIndex = index
                }
            }
        }
    }

    return latestDateIndex
}

func parseDateString(str:String)->[Int]{
    var date = [Int]()
    
    let monthIndex = str.startIndex.advancedBy(5)
    let monthIndexEnd = str.startIndex.advancedBy(8)
    let dayIndex = str.startIndex.advancedBy(9)
    let dayIndexEnd = str.startIndex.advancedBy(11)

    let monthStr = str[Range(start: monthIndex, end: monthIndexEnd)]
    let day = Int(str[Range(start: dayIndex, end: dayIndexEnd)])!
    
    var month = -1
    if monthStr == "Apr"{
        month = 4
    }else if monthStr == "May"{
        month = 5
    }
    
    date.append(month)
    date.append(day)
    return date
}


func parseTimeString(str:String)->[Int]{
    var time = [Int]()
    
    let hrIndex = str.startIndex.advancedBy(0)
    let hrIndexEnd = str.startIndex.advancedBy(2)
    let minIndex = str.startIndex.advancedBy(3)
    let minIndexEnd = str.startIndex.advancedBy(5)
    let secIndex = str.startIndex.advancedBy(6)
    let secIndexEnd = str.startIndex.advancedBy(8)
    
    let hr = Int(str[Range(start: hrIndex, end: hrIndexEnd)])!
    let min = Int(str[Range(start: minIndex, end: minIndexEnd)])!
    let sec = Int(str[Range(start: secIndex, end: secIndexEnd)])!
    
    time.append(hr)
    time.append(min)
    time.append(sec)
    
    return time
}

