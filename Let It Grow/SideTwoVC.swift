//
//  SideTwoVC.swift
//  Let It Grow
//
//  Created by shengxiang guo on 2/12/16.
//  Copyright © 2016 shengxiang guo. All rights reserved.
//

import UIKit

class SideTwoVC: UIViewController {

    @IBOutlet weak var menuButton:UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //  self.revealViewController().rearViewRevealWidth = 150
        if self.revealViewController() != nil {
            menuButton.target = self.revealViewController()
            menuButton.action = #selector(SWRevealViewController.revealToggle(_:))
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        }
    }

    @IBAction func onLogoutPressed(sender: AnyObject) {
        ref.unauth()
        dismissViewControllerAnimated(true, completion: nil)
    }

}
