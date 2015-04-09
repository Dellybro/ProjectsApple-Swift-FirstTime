//
//  ViewController.swift
//  datePick
//
//  Created by Travis Delly on 3/26/15.
//  Copyright (c) 2015 Travis Delly. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var datePicker: UIDatePicker!
    @IBAction func datePicker(sender: AnyObject) {
        //Grab date
        var chosenDate = self.datePicker.date
        //manipulate the date
        
        var formatter = NSDateFormatter()
        formatter.dateFormat = "EEEE"
        
        let day = formatter.stringFromDate(chosenDate)
        let result = "That was a \(day)"
        
        let myAlert = UIAlertController(title: result, message: nil, preferredStyle: UIAlertControllerStyle.Alert)
        myAlert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
        
        
        self.presentViewController(myAlert, animated: true, completion: nil)
        
        
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

