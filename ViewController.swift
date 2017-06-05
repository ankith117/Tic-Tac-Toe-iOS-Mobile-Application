//
//  ViewController.swift
//  ttt
//
//  Created by Ankith Averineni on 10/5/16.
//  Copyright © 2016 Ankith Averineni. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

     @IBOutlet var tt1x1: UILabel!
     @IBOutlet var tt1x2: UILabel!
     @IBOutlet var tt1x3: UILabel!
     @IBOutlet var tt2x1: UILabel!
     @IBOutlet var tt2x2: UILabel!
     @IBOutlet var tt2x3: UILabel!
     @IBOutlet var tt3x1: UILabel!
     @IBOutlet var tt3x2: UILabel!
     @IBOutlet var tt3x3: UILabel!
    
     @IBOutlet var ttb1x1: UIButton!
     @IBOutlet var ttb1x2: UIButton!
     @IBOutlet var ttb1x3: UIButton!
     @IBOutlet var ttb2x1: UIButton!
     @IBOutlet var ttb2x2: UIButton!
     @IBOutlet var ttb2x3: UIButton!
     @IBOutlet var ttb3x1: UIButton!
     @IBOutlet var ttb3x2: UIButton!
     @IBOutlet var ttb3x3: UIButton!
    
    @IBOutlet var ttl: UILabel!
    
    
    @IBOutlet var result: UILabel!
    
    @IBOutlet var reset: UIButton!
    
    var history = Dictionary<Int,Int>()
    var done = false
    var n = 1
    var t = 1
    
    @IBAction func UIbclick(input: UIButton){
        result.isHidden = true
        if !(history[input.tag] != nil) && !done
        {
            self.setbox(box: input.tag, p:n)
            if(n==1)
            {
                n=0
            }
            else
            {
                n=1
            }
            t=t+1
            
        }
        
        checkforwin()
        if((t>9)&&(!done))
        {
            result.isHidden = false
            reset.isHidden = false
            done = true
           result.text = "It's a tie!"
        }
    }
    
    
    func setbox(box: Int, p: Int)
    {
        var pm = "T"
        if(p==1)
        {
            pm = "X"
        }
        else
        {
            pm = "O"
        }
        
        history[box] = p
        
        switch box{
            
        case 1:
            if(pm=="X")
            {
                tt1x1.text = "X"
            }
            else
            {
                tt1x1.text = "O"
            }
            
        case 2:
            if(pm=="X")
            {
                tt1x2.text = "X"
            }
            else
            {
                tt1x2.text = "O"
            }
            
        case 3:
            if(pm=="X")
            {
                tt1x3.text = "X"
            }
            else
            {
                tt1x3.text = "O"
            }
            
        case 4:
            if(pm=="X")
            {
                tt2x1.text = "X"
            }
            else
            {
                tt2x1.text = "O"
            }
            
        case 5:
            if(pm=="X")
            {
                tt2x2.text = "X"
            }
            else
            {
                tt2x2.text = "O"
            }
            
        case 6:
            if(pm=="X")
            {
                tt2x3.text = "X"
            }
            else
            {
                tt2x3.text = "O"
            }
            
        case 7:
            if(pm=="X")
            {
                tt3x1.text = "X"
            }
            else
            {
                tt3x1.text = "O"
            }
            
        case 8:
            if(pm=="X")
            {
                tt3x2.text = "X"
            }
            else
            {
                tt3x2.text = "O"
            }
            
        case 9:
            if(pm=="X")
            {
                tt3x3.text = "X"
            }
            else
            {
                tt3x3.text = "O"
            }
        default: break
            
        }
        
        
        
    }
    
    @IBAction func resetbut(_ sender: AnyObject) {
        done = false
        reset.isHidden = true
        result.isHidden = true
        res()
    }
    
    func res()
    {
        history = [:]
        tt1x1.text = nil
        tt1x2.text = nil
        tt1x3.text = nil
        tt2x1.text = nil
        tt2x2.text = nil
        tt2x3.text = nil
        tt3x1.text = nil
        tt3x2.text = nil
        tt3x3.text = nil
        t = 1
    }
    
    
    func checkforwin()
    {
        let won = ["X":1,"O":0]
        for(key,value) in won {
            if((history[7] == value && history[8] == value && history[9] == value) ||
            (history[4] == value && history[5] == value && history[6] == value) ||
             (history[1] == value && history[2] == value && history[3] == value) ||
             (history[1] == value && history[4] == value && history[7] == value) ||
             (history[2] == value && history[5] == value && history[8] == value) ||
             (history[3] == value && history[6] == value && history[9] == value) ||
             (history[1] == value && history[5] == value && history[9] == value) ||
             (history[3] == value && history[5] == value && history[7] == value))
            {
                result.isHidden = false
                result.text = "\(key) wins!"
                reset.isHidden = false
                done = true
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

