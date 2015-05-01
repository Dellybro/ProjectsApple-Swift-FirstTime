//
//  ViewController.swift
//  Tic Tac Toe
//
//  Created by Travis Delly on 3/30/15.
//  Copyright (c) 2015 Travis Delly. All rights reserved.
//

import UIKit


class ViewController: UIViewController {
    
    
    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var resetButton: UIToolbar!
    
    var gameOver = false
    
    var playerOneName: String = ""
    var playerTwoName: String = ""
    
    var activePlayer = 1
    var playerOne:[Int] = []
    var playerTwo:[Int] = []
    var gameBoard = [0,0,0,0,0,0,0,0,0]
    let winningCombinations = [[1,2,3],[4,5,6],[7,8,9],[1,4,7],[2,5,8],[3,6,9],[1,5,9],[7,5,3]]
    
    
    @IBAction func resetGame(sender: AnyObject) {
        resetGamefunc()
    }
    func resetGamefunc(){
        gameOver = false
        activePlayer = 1
        gameBoard = [0,0,0,0,0,0,0,0,0]
        playerOne = []
        playerTwo = []
        
        
        var button = UIButton()
        
        for(var i = 1; i<10; i++){
            button = view.viewWithTag(i) as! UIButton
            button.setImage(nil, forState: nil)
            
        }
        
    }
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        var secondVC: StartController = segue.destinationViewController as! StartController
    }
    
    
    @IBAction func buttonPressed(sender: AnyObject) {
        
        if gameBoard[sender.tag-1] == 0{
            if activePlayer == 2 {
                sender.setImage(UIImage(named: "nought.png"), forState: nil)
                playerTwo.append(sender.tag)
                activePlayer = 1
            } else {
                sender.setImage(UIImage(named: "cross.png"), forState: nil)
                playerOne.append(sender.tag)
                activePlayer = 2
            }
            
            gameBoard[sender.tag-1] = 1
            print(winningCombinations.count)
            println(winningCombinations[0].count)
            
            for(var i = 0; i < winningCombinations.count; i++){
                var oneCount = 0
                var twoCount = 0
                for(var k = 0; k < winningCombinations[0].count; k++){
                    if contains(playerOne, winningCombinations[i][k]){
                        oneCount++
                    } else if contains(playerTwo, winningCombinations[i][k]){
                        twoCount++
                    }
                }
                if oneCount == 3{
                    alertMessage("Winner", message: "\(playerOneName) has Won!", okButton: "OK!")
                    gameOver = true
                } else if twoCount == 3{
                    alertMessage("Winner", message: "\(playerTwoName) has Won!", okButton: "OK!")
                    gameOver = true
                }
            }
            
            if playerOne.count + playerTwo.count == 9 {
                alertMessage("Tie", message: "Game resulted in tie", okButton: "OK!")
                gameOver = true
            }
            
        } else {
            alertMessage("Invalid Move", message: "Square is taken", okButton: "OK!")
            
        }
        if self.gameOver == true {
            let priority = DISPATCH_QUEUE_PRIORITY_DEFAULT
            dispatch_async(dispatch_get_global_queue(priority, 0)) {
                // do some task
                dispatch_async(dispatch_get_main_queue()) {
                    let storyboard = UIStoryboard(name: "Main", bundle: nil)
                    let vc = storyboard.instantiateViewControllerWithIdentifier("Start") as! UIViewController
                    self.presentViewController(vc, animated: true, completion: nil)
                }
            }
        }
        
        
    }
    
    func alertMessage(title: String, message: String, okButton: String){
        
        
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.Alert)
        let okayButton = UIAlertAction(title: okButton, style: UIAlertActionStyle.Cancel, handler: nil)
        alert.addAction(okayButton)
        presentViewController(alert, animated: false, completion: nil)
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

