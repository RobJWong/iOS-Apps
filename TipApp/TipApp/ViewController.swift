//
//  ViewController.swift
//  TipApp
//
//  Created by Robert Wong on 6/9/17.
//  Copyright © 2017 Robert Wong. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var totalNumber : UITextField!
    @IBOutlet var tipNumber : UITextField!
    @IBOutlet var splitPeople : UITextField!
    @IBOutlet var answerNumber : UILabel!
    
    @IBAction func calculateSplit(_ sender: UIButton)
    {
        if let total = Double(totalNumber.text!), let tip = Double(tipNumber.text!), let people = Double(splitPeople.text!)
        {
            let splitNumber: String = String(format: "%.2f", ((total * (1 + (tip)/100))/people))
            answerNumber.text = splitNumber
        }
        else
        {
            answerNumber.text = "Not calculated yet"
        }
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
            answerNumber.text = nil
        // Do any additional setup after loading the view, typically from a nib.
    }


}

