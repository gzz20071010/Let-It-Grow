//
//  HomeVC.swift
//  Let It Grow
//
//  Created by shengxiang guo on 2/11/16.
//  Copyright © 2016 shengxiang guo. All rights reserved.
//

import UIKit
import Firebase

class HomeVC: UIViewController {

    var ref = Firebase(url: "https://shengxiang.firebaseio.com")
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func waterBtnPressed(sender: AnyObject) {
        let value = ["WaterStatus" : "true"]
        print(UID)
        let usersRef = ref.childByAppendingPath("users").childByAppendingPath(UID)
        usersRef.updateChildValues(value)
        
        print("branch")
      //  usersRef.setValue(users)
    }


}
