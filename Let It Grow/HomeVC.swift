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
        let alanisawesome = ["full_name": "Alan Turing", "date_of_birth": "June 23, 1912"]
        let gracehop = ["full_name": "Grace Hopper", "date_of_birth": "December 9, 1906"]
        
        let usersRef = ref.childByAppendingPath("users")
        
        let users = ["alanisawesome": alanisawesome, "gracehop": gracehop]
        usersRef.setValue(users)
    }


}
