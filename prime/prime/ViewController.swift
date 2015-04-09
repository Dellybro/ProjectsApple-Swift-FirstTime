//
//  ViewController.swift
//  prime
//
//  Created by Travis Delly on 3/29/15.
//  Copyright (c) 2015 Travis Delly. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    
    @IBOutlet weak var resultLabel: UILabel!
    
    @IBOutlet weak var userinput: UITextField!
    
    func isPrime(numberInt: Int) -> Bool{
        var isPrime = true
        if numberInt == 1 {isPrime = false}
        if numberInt > 2{
            for var i = 2; i < numberInt; i+=1{
                if numberInt % i == 0{
                    isPrime = false
                }
            }
        }
        return isPrime
    }
    
    @IBAction func buttonPressed(sender: AnyObject) {
        var unwrappedNumber = userinput.text.toInt()
        if unwrappedNumber != nil{
            if isPrime(unwrappedNumber!){
                resultLabel.text = "\(unwrappedNumber!) is prime!"} else {
                resultLabel.text = "\(unwrappedNumber!) is not prime.... try again!"
            }
        } else {
            resultLabel.text = "Please enter a number in the box"
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

