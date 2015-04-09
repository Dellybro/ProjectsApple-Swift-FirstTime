//
//  StartController.swift
//  Tic Tac Toe
//
//  Created by Travis Delly on 3/30/15.
//  Copyright (c) 2015 Travis Delly. All rights reserved.
//

import UIKit



class StartController: UIViewController {

    @IBOutlet weak var firstPlayer: UITextField!
    
    @IBOutlet weak var secondPlayer: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    func alertMessage(title: String, message: String, okButton: String){
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.Alert)
        let okayButton = UIAlertAction(title: okButton, style: UIAlertActionStyle.Cancel, handler: nil)
        alert.addAction(okayButton)
        
        presentViewController(alert, animated: true, completion: nil)
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if countElements(firstPlayer.text) >= 2 && countElements(secondPlayer.text) >= 2{
            var secondVC: ViewController = segue.destinationViewController as ViewController
        
            secondVC.playerOneName = firstPlayer.text!
            secondVC.playerTwoName = secondPlayer.text!
        } else {
            alertMessage("Invalid name", message: "Name needs 2 or more letters", okButton: "OK!")
        }
    }
    
    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        resignFirstResponder()
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
