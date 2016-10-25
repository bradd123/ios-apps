//
//  ViewController.swift
//  Cat Years
//
//  Created by Brahma Reddy Chilakala on 24/10/16.
//  Copyright © 2016 Brahma Reddy Chilakala. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var ageTextField: UITextField!
    
    @IBOutlet var ageLabel: UILabel!
    
    
    @IBAction func submitPressed(_ sender: AnyObject) {
        
        if let ageInCatYears = Int(ageTextField.text!) {
            
            ageLabel.text = String(ageInCatYears * 7)
            
        } else {
            
            ageLabel.text = "Enter Correct Number"
            
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

