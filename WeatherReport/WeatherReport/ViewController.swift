//
//  ViewController.swift
//  WeatherReport
//
//  Created by Travis Delly on 3/30/15.
//  Copyright (c) 2015 Travis Delly. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var resultLabel: UILabel!
    
    @IBOutlet weak var userCity: UITextField!
    
    
    @IBAction func buttonPressed(sender: AnyObject) {
        
        var url = NSURL(string: "http://www.weather-forecast.com/locations/" + userCity.text.stringByReplacingOccurrencesOfString(" ", withString: "-") + "/forecasts/latest")
        
        if url != nil {
            
            let task = NSURLSession.sharedSession().dataTaskWithURL(url!, completionHandler: {(data, response, error) -> Void in
                
                var urlError = false
                
                var weather = ""
                
                
                if error == nil {
                    
                    var urlContent = NSString(data: data, encoding: NSUTF8StringEncoding) as NSString!
                    
                    //Creating an array of content between all span classses. Now we have all span information.
                    var urlContentArray = urlContent.componentsSeparatedByString("<span class=\"phrase\">")
                    
                    if urlContentArray.count > 1 {
                        var weatherArray = urlContentArray[1].componentsSeparatedByString("</span>")
                        
                        weather = weatherArray[0] as String
                        
                        weather = weather.stringByReplacingOccurrencesOfString("&deg;", withString: "º")
                        
                        
                    } else {
                        urlError = true
                    }
                    
                } else {
                    urlError = true
                    
                }
                
                dispatch_async(dispatch_get_main_queue()){
                    if urlError == true {
                        self.showError()
                    } else {
                        self.resultLabel.text = weather
                    }
                    
                }
                
                
                
            })
            
            task.resume()
            
        }else{
            showError()
        }
        
        

        
    }
    func showError(){
        resultLabel.text = "Could not find weather for that city"
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

