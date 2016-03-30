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
        
        let value = ["DeviceSerialNumber" : serialNumTextfield.text!,
                     "PlantName": plantNameTF.text!,
                     "IdealWaterLevel":idealWaterLevelTF.text!]
        
        let usersRef = ref.childByAppendingPath("users").childByAppendingPath(UID).childByAppendingPath("Devices")
        .childByAppendingPath(serialNumTextfield.text)
        
        usersRef.updateChildValues(value)
        
        performSegueWithIdentifier("SideOneVC", sender: nil)
        

    }

}
