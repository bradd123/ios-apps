//
//  ViewController.swift
//  Hello World
//
//  Created by Brahma Reddy Chilakala on 17/10/16.
//  Copyright © 2016 Brahma Reddy Chilakala. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var nameField: UITextField!
    @IBOutlet var nameLabel: UILabel!
    
    
    @IBAction func submitButtonTapped(_ sender: AnyObject) {
        nameLabel.text = nameField.text
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

