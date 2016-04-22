//
//  DetailVC.swift
//  Let It Grow
//
//  Created by shengxiang guo on 4/12/16.
//  Copyright © 2016 shengxiang guo. All rights reserved.
//

import UIKit
import Foundation

class DetailVC: UIViewController {
    
    
    @IBOutlet weak var plantName: UILabel!
    @IBOutlet weak var plantStatus: UILabel!
    
    @IBOutlet weak var lightSensorReading: UILabel!
    @IBOutlet weak var sensor1: UILabel!
    @IBOutlet weak var sensor2: UILabel!
    @IBOutlet weak var sensor3: UILabel!
    @IBOutlet weak var roomTemp: UILabel!
    @IBOutlet weak var roomHeatIndex: UILabel!
    @IBOutlet weak var roomHumidity: UILabel!
    @IBOutlet weak var tempReading: UILabel!
    @IBOutlet weak var lastChecked: UILabel!
    @IBOutlet weak var lastWatered: UILabel!
    
    var plant:Plant!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        plantName.text = plant.deviceName
        if plant.needsWater == 0 {
            plantStatus.text = "Needs Water"
        }else{
            plantStatus.text = "Good"
        }
        
        lightSensorReading.text = "\(plant.date[findLatestDate(plant)].time[findLatestTime(plant)].data["LIGHT_SENSOR"]!)"
        sensor1.text = "\(plant.date[findLatestDate(plant)].time[findLatestTime(plant)].data["SENSOR_1"]!)"
        sensor2.text = "\(plant.date[findLatestDate(plant)].time[findLatestTime(plant)].data["SENSOR_2"]!)"
        sensor3.text = "\(plant.date[findLatestDate(plant)].time[findLatestTime(plant)].data["SENSOR_3"]!)"
        roomTemp.text = "\(plant.date[findLatestDate(plant)].time[findLatestTime(plant)].data["ROOM_TEMPERATURE"]!)"
        roomHumidity.text = "\(plant.date[findLatestDate(plant)].time[findLatestTime(plant)].data["ROOM_HUMIDITY"]!)"
        tempReading.text = "\(plant.date[findLatestDate(plant)].time[findLatestTime(plant)].data["SOIL_TEMPERATURE"]!)"
        lastChecked.text = "\(plant.lastChecked)"
        lastWatered.text = "\(plant.lastWatered)"
        
    }
    
    
    @IBAction func onCheckBtnPressed(sender: AnyObject) {
        let value = ["Needs_Water":1]
        
        let waterRef = ref.childByAppendingPath("Devices").childByAppendingPath(plant.deviceID)
        waterRef.updateChildValues(value)
        
    }

    @IBAction func onReturnPressed(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func onEditPressed(sender: AnyObject) {
        
    }
    

    
}
