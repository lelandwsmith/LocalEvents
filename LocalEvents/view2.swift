//
//  view2.swift
//  LocalEvents
//
//  Created by Connor  Wybranowski on 10/2/14.
//  Copyright (c) 2014 Wybros. All rights reserved.
//

import Foundation
import UIKit

class view2: UIViewController {
    
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
    
    
    @IBAction func signUp(sender: UIButton) {
        var user = PFUser()
        // Check that email and password are not blank
        if !email.text.isEmpty || !password.text.isEmpty {
        
        user.username = email.text
        user.password = password.text
        
        user.signUpInBackgroundWithBlock {
            (succeeded: Bool!, error: NSError!) -> Void in
            if error == nil {
                // Display confirmation once account is created
                var done: UIAlertView = UIAlertView()
                done.title = "Hooray!"
                done.message = "Your account has been created"
                done.addButtonWithTitle("Okay")
                done.show()
            } else {
                // Display error in Alert View
                var alert:UIAlertView = UIAlertView()
                alert.title = "Oops!"
                alert.message = "This email is taken"
                alert.addButtonWithTitle("Okay")
                alert.show()
                // Show the errorString somewhere and let the user try again.
            }
        }
        } else {
            // Display error if email / password blank
            var warning: UIAlertView = UIAlertView()
            warning.title = "Oops!"
            warning.message = "You left your email or password blank"
            warning.addButtonWithTitle("Okay")
            warning.show()
        }
        
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}
