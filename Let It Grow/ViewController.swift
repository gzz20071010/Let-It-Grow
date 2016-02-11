//
//  ViewController.swift
//  Let It Grow
//
//  Created by shengxiang guo on 2/10/16.
//  Copyright © 2016 shengxiang guo. All rights reserved.
//

import UIKit
import Firebase

class ViewController: UIViewController {

    @IBOutlet weak var usernmaTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    //ref.authUser("bobtony@example.com", password: "correcthorsebatterystaple",
    //ref.createUser("shadowtesting@example.com", password: "correcthorsebatterystaple",
 
    @IBAction func signinBtnPressed(sender: AnyObject) {
        
        USERNAME = usernmaTF.text
        
        ref.authUser("\(usernmaTF.text!)", password:"\(passwordTF.text)") {
            error, authData in
            if error != nil {
                // Something went wrong. :(
                print("something went wrong")
                if let errorCode = FAuthenticationError(rawValue: error.code) {
                    switch (errorCode) {
                    case .UserDoesNotExist:
                        print("Handle invalid user")
                    case .InvalidEmail:
                        print("Handle invalid email")
                    case .InvalidPassword:
                        print("Handle invalid password")
                    default:
                        print("Handle default situation")
                    }
                }
            } else {
                // Authentication just completed successfully :)
                
                // The logged in user's unique identifier
                print(authData.uid)
                print(authData.provider)
                //print(authData.providerData["dispalyName"])
                
                
                UID = authData.uid
                // Create a new user dictionary accessing the user's info
                // provided by the authData parameter
                let newUser = [
                    "provider": authData.provider,
                    "WaterStatus": "false",
                    "username": self.usernmaTF.text
                    //"displayName": authData.providerData["displayName"] as? NSString as? String,
                ]
                
                
                // Create a child path with a key set to the uid underneath the "users" node
                // This creates a URL path like the following:
                //  - https://<YOUR-FIREBASE-APP>.firebaseio.com/users/<uid>
                ref.childByAppendingPath("users").childByAppendingPath("\(authData.uid)")
                    .updateChildValues(newUser)
            }
        }
        performSegueWithIdentifier("HomeVC", sender: nil)
    }

    @IBAction func signupBtnPressed(sender: AnyObject) {
    
        ref.createUser("\(usernmaTF.text!)" , password: "\(passwordTF.text)",
            withValueCompletionBlock: { error , result in
                
                if error != nil {
                    // There was an error creating the account
                    print("\(self.usernmaTF.text!)")
                    print("sign up error")
                    print(error.code)
                    print(error)
                } else {
                    let uid = result["uid"] as? String
                    print("Successfully created user account with uid: \(uid)")
                }
        })
        
    }
}

