//
//  ViewController.swift
//  Image Picker
//
//  Created by Brahma Reddy Chilakala on 07/11/16.
//  Copyright © 2016 Brahma Reddy Chilakala. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBAction func experiment(_ sender: AnyObject) {
        
        let nextController = UIImagePickerController()
        
        self.present(nextController, animated: true) {
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

