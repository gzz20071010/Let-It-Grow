//
//  SideOneVC.swift
//  Let It Grow
//
//  Created by shengxiang guo on 2/12/16.
//  Copyright © 2016 shengxiang guo. All rights reserved.
//

import UIKit
import Firebase

class SideOneVC: UIViewController,UITableViewDataSource,UITableViewDelegate {

    @IBOutlet weak var noPlantLb: UILabel!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var menuButton:UIBarButtonItem!
    
    //var myPlants = [Plant]()
    var myDevices = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.revealViewController().rearViewRevealWidth = 150
        tableView.dataSource = self
        tableView.delegate = self
        
        // Get a reference to user account
//        let userRef = ref.childByAppendingPath("users").childByAppendingPath(UID)
//        //Get plants list
//        userRef.observeEventType(.Value, withBlock: { snapshot in
//            
//            //print(snapshot.value.objectForKey("username"))
//            
//           
//            
//            }, withCancelBlock: { error in
//                print(error.description)
//        })
        
        
        if self.revealViewController() != nil {
            menuButton.target = self.revealViewController()
            menuButton.action = "revealToggle:"
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        }
        
        //testing
        self.myDevices.append("device number 1")
        self.myDevices.append("device number 2")
        self.myDevices.append("device number 3")

        print(myDevices[1])
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCellWithIdentifier("PlantCell", forIndexPath: indexPath) as? PlantCell{
            var str: String!
            str = myDevices[indexPath.row]
            cell.textlb.text = str
            print(myDevices[indexPath.row])
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myDevices.count
    }



}
