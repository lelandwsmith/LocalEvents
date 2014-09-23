//
//  ViewController.swift
//  LocalEvents
//
//  Created by Connor  Wybranowski on 9/22/14.
//  Copyright (c) 2014 Wybros. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var Name: UITextField!
    @IBOutlet weak var Color: UITextField!
    
    var gameScore = PFObject(className: "GameScore")
    var query = PFQuery(className: "GameScore")
    
    @IBAction func Save(sender: AnyObject) {
        gameScore.setObject(Color.text, forKey: "favoriteColor")
        gameScore.setObject(Name.text, forKey: "playerName")
        gameScore.saveInBackgroundWithBlock {
            (success: Bool!, error: NSError!) -> Void in
            if (success != nil) {
                NSLog("Object created with id: \(self.gameScore.objectId)")
            } else {
                NSLog("%@", error)
            }
        }

    }
    
    @IBAction func Call(sender: AnyObject) {
        query.getObjectInBackgroundWithId(gameScore.objectId) {
            (gameScore: PFObject!, error: NSError!) -> Void in
            if error == nil {
                NSLog("%@", gameScore.objectForKey("playerName") as NSString!)
                NSLog("%@", gameScore.objectForKey("favoriteColor") as NSString!)
                //self.Name.text = NSString(gameScore)
            } else {
                NSLog("%@", error)
            }
        }

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

