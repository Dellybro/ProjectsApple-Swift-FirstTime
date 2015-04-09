//
//  ViewController.swift
//  stopWatch
//
//  Created by Travis Delly on 3/29/15.
//  Copyright (c) 2015 Travis Delly. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    

    @IBOutlet weak var time: UILabel!
    
    @IBAction func stop(sender: AnyObject) {
        
        timer.invalidate()
        
        count = 0
        
        time.text = "0"
    }
    @IBAction func pause(sender: AnyObject) {
        
        timer.invalidate()
    }
    
    var count = 0
    
    func updateTime(){
        count++
        
        time.text = "\(count)"
    }
    
    @IBAction func start(sender: AnyObject) {
        
        timer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: Selector("updateTime"), userInfo: nil, repeats: true)
    }
    
    var timer = NSTimer()
    func result(){
        count++
        
        println(count)
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

