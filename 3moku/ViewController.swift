//
//  ViewController.swift
//  3moku
//
//  Created by 迫 佑樹 on 2015/12/31.
//  Copyright © 2015年 迫 佑樹. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var playing = true
    //Twitterが1, Lineが2，何も置かれてなかったら0
    var activePlayer = 1
    
    var gameState = [0,0,0,0,0,0,0,0,0]
    
    var winPattern = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]
    
    
    var image = UIImage(named: "twitter.png")
    
    @IBAction func resetButton(sender: AnyObject) {
        
        winLabel.alpha = 0
        
        activePlayer = 1
        
        gameState = [0,0,0,0,0,0,0,0,0]
        
        playing = true
        
        var button : UIButton
        
        for var i=0; i<9; i++ {
        
        button = view.viewWithTag(i) as! UIButton
        
        button.setImage(nil, forState: .Normal)
        
        }
    }
    @IBOutlet var winLabel: UILabel!
    @IBOutlet var button: UIButton!
    

    @IBAction func buttonPressed(sender: AnyObject) {
        
        if gameState[sender.tag] == 0 && playing {
            
            gameState[sender.tag] = activePlayer
            if activePlayer == 1 {
                image = UIImage(named: "twitter.png")
                activePlayer = 2
            } else if activePlayer == 2 {
                image = UIImage(named: "line.png")
                activePlayer = 1
            }
            
            sender.setImage(image, forState: .Normal)

            print(sender.tag)
        }
        
        for pattern in winPattern {
            
        
            if gameState[pattern[0]] != 0 && gameState[pattern[0]] == gameState[pattern[1]] && gameState[pattern[0]] == gameState[pattern[2]]{
                print("fin")
                
                if gameState[pattern[0]] == 1{
                    
                    winLabel.alpha = 1
                    winLabel.text = "Twitter won!!"
                    
                } else if gameState[pattern[0]] == 2{
                    
                    winLabel.alpha = 1
                    winLabel.text = "LINE won!!"
                    
                }
                
                playing = false
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

