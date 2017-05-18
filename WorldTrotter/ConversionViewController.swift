//
//  ConversionViewController.swift
//  WorldTrotter
//
//  Created by Robert Wong on 5/18/17.
//  Copyright © 2017 Robert Wong. All rights reserved.
//

import UIKit

class ConversionViewController: UIViewController
{
    @IBOutlet var celsiusLabel: UILabel!
    @IBOutlet var textField UITextField!
    
    @IBAction func fahrenheitFieldEditingChanged(_ textField: UITextField)
    {
        if let text = textField.text, !text.isEmpty {
            celsiusLabel.text = text
        }
            //if text field is not empty and text field has text then set the celsiusLabel to text
        else
        {
            celsiusLabel.text = "???"
        }
    }
    
}
