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
    
    var myPlants = [Plant]()
    var myDevices = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.revealViewController().rearViewRevealWidth = 150
        tableView.dataSource = self
        tableView.delegate = self
        
        
        if self.revealViewController() != nil {
            menuButton.target = self.revealViewController()
            menuButton.action = "revealToggle:"
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        }
    }
    
    
    override func viewDidAppear(animated: Bool) {
        let resRef = ref.childByAppendingPath("users").childByAppendingPath("\(UID)").childByAppendingPath("Devices")
        
        resRef.observeEventType(.Value, withBlock:{snapshot in
            self.myDevices = [String]()
            if let snapshots = snapshot.children.allObjects as? [FDataSnapshot]{
                for snap in snapshots{
                    //print("SNAP: \(snap)")
                    // let value = snap.value
                    self.myDevices.append("\(snap.key)")
                    if let dic = snap.value as? Dictionary<String, AnyObject>{
                        var plant: Plant
                        var plantDates = [Date]()
                        let checknow = dic["CheckNow"] as? Int
                        let deviceName = dic["PlantName"] as? String
                        let deviceID = dic["DeviceSerialNumber"] as? String
                        if let dates = dic["Date"] as? Dictionary<String,AnyObject>{
                            //print("hi")
                          //  if let dateStr = dates as? Dictionary<String, AnyObject>{
                               // print(dates)
                                //print(dateStr)
                                for (key,_) in dates {
                                    //print("\(key)")
                                    if let day = dates["\(key)"]as? Dictionary<String, AnyObject>{
                                        var aggregate = [String]()
                                        var initial = [String]()
                                        var date: Date
//                                        print("hi")
//                                        print(day)
                                        if let agg = day["Aggregate"] as? Dictionary<String, AnyObject>{
                                           // print(agg)
                                            let lightSensor = agg["LIGHT_SENSOR"] as? Float
                                            let sensor1 = agg["SENSOR_1"] as? Float
                                            let sensor2 = agg["SENSOR_2"] as? Float
                                            let tmpSensor = agg["TEMP_SENSOR"] as? Float
                                           // print(lightSensor)
                                            aggregate.append("\(lightSensor!)")
                                            aggregate.append("\(sensor1!)")
                                            aggregate.append("\(sensor2!)")
                                            aggregate.append("\(tmpSensor!)")
                                            //print(tmpSensor)
                                            //print(aggregate)
                                        }
                                        if let ini = day["Initial"] as? Dictionary<String, AnyObject>{
                                            let lightSensor = ini["LIGHT_SENSOR"] as? Float
                                            let sensor1 = ini["SENSOR_1"] as? Float
                                            let sensor2 = ini["SENSOR_2"] as? Float
                                            let tmpSensor = ini["TEMP_SENSOR"] as? Float
                                            //print(lightSensor)
                                            initial.append("\(lightSensor)")
                                            initial.append("\(sensor1)")
                                            initial.append("\(sensor2)")
                                            initial.append("\(tmpSensor)")
                                        }
                                        date = Date(date: "\(key)", aggregate: aggregate, initial: initial)
                                        //print(date.aggregate)
                                        plantDates.append(date)
                                    }
                                   // print(aggregate)
                               
                               }
                        }
                        plant = Plant(deviceName: "\(deviceName!)", deviceID: "\(deviceID)", checkNow: "\(checknow)", date: plantDates)
                           // print(plant.deviceName)
                        
                        var flag = false
                        for p in self.myPlants{
                            if p.deviceName == plant.deviceName{
                                flag = true
                            }
                        }
                        
                        if !flag{
                            self.myPlants.append(plant)
                        }
                        
                    }
                    //}
                }
                
                //print("self.reservation: ", self.reservations)
                self.tableView.reloadData()
                
                
                if self.myPlants.count == 0 {
                    self.tableView.hidden = true
                }else{
                    self.tableView.hidden = false
                }
            }
        })
        
    }

    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {

        if let cell = tableView.dequeueReusableCellWithIdentifier("PlantCell", forIndexPath: indexPath)as? PlantCell{
            let str = myPlants[indexPath.row].deviceName
            cell.textlb.text = str
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myPlants.count
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let plant = myPlants[indexPath.row]

        performSegueWithIdentifier("DetailVC", sender: plant)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "DetailVC"{

            if let detailVC = segue.destinationViewController as? DetailVC{

                if let plant = sender as? Plant{
                    detailVC.plant = plant
                }
            }
        }
    }


}
