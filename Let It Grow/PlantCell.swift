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
//    
//    func configureCell(plant:Plant){
//        self.plant = plant
//        self.plantLb.text = plant.deviceName
//    }
//
//    func configureCellString(str:String){
//        print(str)
//        self.plantLb.text = str
//    }
    func configureCell(plant:Plant){
        
    }
    
    @IBAction func onWaterBtnPressed(sender: AnyObject) {
    }
}