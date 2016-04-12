//
//  AddPlantVC.swift
//  Let It Grow
//
//  Created by shengxiang guo on 2/12/16.
//  Copyright © 2016 shengxiang guo. All rights reserved.
//

import UIKit

class AddPlantVC: UIViewController {

    @IBOutlet weak var idealWaterLevelTF: UITextField!
    @IBOutlet weak var plantNameTF: UITextField!
    @IBOutlet weak var serialNumTextfield: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }


    @IBAction func onAddBtnPressed(sender: AnyObject) {
        let agg = ["LIGHT_SENSOR": 0.0,
                    "SENSOR_1": 0.0,
                    "SENSOR_2": 0.0,
                    "SENSOR_3": 0.0,
                    "TEMP_SENSOR": 0.0
                    ]
        
        //let valueDate = ["2016-Jan-02": agg]

        let value = ["DeviceSerialNumber" : serialNumTextfield.text!,
                     "PlantName": plantNameTF.text!,
                     "CheckNow": 0,
                     "ID": "1",
                     "Date": "2016-Jan-02"
                    ]
        
        
        let usersRef = ref.childByAppendingPath("users").childByAppendingPath(UID).childByAppendingPath("Devices")
        .childByAppendingPath(serialNumTextfield.text)
        
        usersRef.updateChildValues(value as [NSObject : AnyObject])
        
        let userRefAgg = usersRef.childByAppendingPath("Date")
        .childByAppendingPath("2016-Jan-02").childByAppendingPath("Aggregate")
        
        userRefAgg.updateChildValues(agg)
        
        let userRefInit = usersRef.childByAppendingPath("Date")
            .childByAppendingPath("2016-Jan-02").childByAppendingPath("Initial")
        
        userRefInit.updateChildValues(agg)
        
        performSegueWithIdentifier("SideOneVC", sender: nil)
        

    }

}
