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
        
        /*
        for accessing the photo viewer
        let nextController = UIImagePickerController()
        
        self.present(nextController, animated: true) {
        }
        */
        
        // For alerts
        
        let controller = UIAlertController()
        controller.title = "Test Alert"
        controller.message = "This is a test"
        let okAction = UIAlertAction(title: "ok", style: UIAlertActionStyle.default) {action in
            self.dismiss(animated: true, completion: nil)
        }
        controller.addAction(okAction)
        self.present(controller, animated: true, completion: nil)
        
        
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

