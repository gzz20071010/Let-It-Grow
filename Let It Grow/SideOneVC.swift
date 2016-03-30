//
//  SideOneVC.swift
//  Let It Grow
//
//  Created by shengxiang guo on 2/12/16.
//  Copyright © 2016 shengxiang guo. All rights reserved.
//

import UIKit

class SideOneVC: UIViewController {

    @IBOutlet weak var noPlantLb: UILabel!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var menuButton:UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
      //  self.revealViewController().rearViewRevealWidth = 150
        
        
        if self.revealViewController() != nil {
            menuButton.target = self.revealViewController()
            menuButton.action = "revealToggle:"
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        }
    }



}
