//
//  PlantCell.swift
//  Let It Grow
//
//  Created by shengxiang guo on 3/30/16.
//  Copyright © 2016 shengxiang guo. All rights reserved.
//

import Foundation
import UIKit

class PlantCell: UITableViewCell{
    
//    @IBOutlet weak var pic: UIImageView!
//    @IBOutlet weak var plantLb: UILabel!
    
   // var plant:Plant!
    @IBOutlet weak var textlb: UILabel!
    @IBOutlet weak var sensorLbl1: UILabel!
    @IBOutlet weak var sensorLb2: UILabel!
    @IBOutlet weak var sensorLb3: UILabel!
    @IBOutlet weak var waterBtn: UIButton!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func configureCell(plant:Plant){
        textlb.text = plant.deviceName
        sensorLbl1.text = "Sensor 1: "+parsingSensorData("\(plant.date[0].time[0].data["SENSOR_1"])")
        sensorLb2.text = "Sensor 2: "+parsingSensorData("\(plant.date[0].time[0].data["SENSOR_2"])")
        sensorLb3.text = "Sensor 3: "+parsingSensorData("\(plant.date[0].time[0].data["SENSOR_3"])")
        waterBtn.titleLabel?.text = sensorLbl1.text
    }
    
    func parsingSensorData(str:String)->String{
        var status:String!
        if Int(str) > 70 {
            status = "Wet"
        }else if Int(str) < 30{
            status = "Dry"
        }else{
            status = "Good"
        }
        return status
    }
    
    @IBAction func onWaterBtnPressed(sender: AnyObject) {
    }
}