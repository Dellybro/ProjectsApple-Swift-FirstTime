//
//  SecondViewController.swift
//  todolist
//
//  Created by Travis Delly on 3/30/15.
//  Copyright (c) 2015 Travis Delly. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var itemToDo: UITextField!
    
    @IBAction func buttonPressed(sender: AnyObject) {
        
        toDoList.append(itemToDo.text)
        //Reset text field afterwards
        itemToDo.text = ""
        
        //Save everything on toDoList on nsUSER
        
        NSUserDefaults.standardUserDefaults().setObject(toDoList, forKey: "toDoList")
        
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func touchesBegan(touches: NSSet, withEvent event: UIEvent){
        self.view.endEditing(true)
    }
    func textFieldShouldReturn(textfield: UITextField!) -> Bool{
        
        itemToDo.resignFirstResponder()
        return true
    }


}

