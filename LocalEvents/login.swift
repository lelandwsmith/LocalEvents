//
//  login.swift
//  LocalEvents
//
//  Created by Connor  Wybranowski on 10/2/14.
//  Copyright (c) 2014 Wybros. All rights reserved.
//

import Foundation
import UIKit

class login: UIViewController {
    
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
    
    @IBAction func login(sender: UIButton) {
        PFUser.logInWithUsernameInBackground(email.text, password:password.text) {
            (user: PFUser!, error: NSError!) -> Void in
            if user != nil {
                // Display success
                var success:UIAlertView = UIAlertView()
                success.title = "Hooray!"
                success.message = "Login Successful!"
                success.addButtonWithTitle("Get Started")
                success.show()
                
            } else {
                // The login failed. Check error to see why.
                var failed:UIAlertView = UIAlertView()
                failed.title = "Oh no!"
                failed.message = "Login Unsuccessful!"
                failed.addButtonWithTitle("Try again")
                failed.show()
            }
        }
        
        
        
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}