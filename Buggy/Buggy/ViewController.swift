//
//  ViewController.swift
//  Buggy
//
//  Created by Robert Wong on 6/20/17.
//  Copyright © 2017 Robert Wong. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBAction func buttonTapped(_ sender: UIButton)
    //@IBAction func switchToggled(_ sender: UISwitch)
    //@IBAction func buttonTapped(_ sender: UISwitch)
    {
        print("Method: \(#function) in file: \(#file) line: \(#line) called.")
        
        badMethod()
        
        //print("Called buttonTapped(_:)")
        
        //Log sender
        //print("sender: \(sender)")
        //Log the control state
        //print("Is the control on? \(sender.isOn)")
    }
    
    func badMethod() {
        let array = NSMutableArray()
        
        for i in 0..<10 {
            array.insert(i, at: i)
        }
        
        //Go one step too far by emptying the array (notice the range change)
        for _ in 0...10 {
            array.remove(at: 0)
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

