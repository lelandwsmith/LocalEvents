//
//  ViewController.swift
//  LocalEvents
//
//  Created by Connor  Wybranowski on 9/22/14.
//  Copyright (c) 2014 Wybros. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
    
    @IBOutlet weak var returnEmail: UILabel!
    @IBOutlet weak var returnPassword: UILabel!
    
    
    var userInfo = PFObject(className: "userInfo")
    var query = PFQuery(className: "userInfo")
    
    @IBAction func Save(sender: AnyObject) {
        userInfo.setObject(email.text, forKey: "email")
        userInfo.setObject(password.text, forKey: "password")
        userInfo.saveInBackgroundWithBlock {
            (success: Bool!, error: NSError!) -> Void in
            if (success != nil) {
                NSLog("Object created with id: \(self.userInfo.objectId)")
            } else {
                NSLog("%@", error)
            }
        }

    }
    
    @IBAction func Call(sender: AnyObject) {
        query.getObjectInBackgroundWithId(userInfo.objectId) {
            (userInfo: PFObject!, error: NSError!) -> Void in
            if error == nil {
                NSLog("%@", userInfo.objectForKey("email") as NSString!)
                NSLog("%@", userInfo.objectForKey("password") as NSString!)
                
                
                self.returnEmail.text = userInfo.objectForKey("email") as NSString
                self.returnPassword.text = userInfo.objectForKey("password") as NSString
                
                
            } else {
                NSLog("%@", error)
            }
        }

    }
    
    // dismiss keyboard after touch outside
    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        self.view.endEditing(true)
    }
    
    // dismiss keyboard after hitting return
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        
        textField.resignFirstResponder()
        
        return true;
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // for dismissing keyboard
        email.delegate = self
        password.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

