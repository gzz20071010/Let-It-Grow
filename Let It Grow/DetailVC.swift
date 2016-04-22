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
    
    var plant:Plant!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       // plantName.text = plant.deviceName
        
    }
    
    

    @IBAction func onReturnPressed(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func onEditPressed(sender: AnyObject) {
        
    }
    

    
}
