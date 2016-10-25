//
//  ViewController.swift
//  Click Counter
//
//  Created by Brahma Reddy Chilakala on 20/01/16.
//  Copyright (c) 2016 Brahma Reddy Chilakala. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var count = 0
    var label:UILabel!
    var adlabel:UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //Label
        var label = UILabel()
        label.frame = CGRectMake(150,150,60, 60)
        label.text = "0"
        
        self.view.addSubview(label)
        self.label = label
        
        //additional label
        var adlabel = UILabel()
        adlabel.frame = CGRectMake(250,150,60, 60)
        adlabel.text = "0"
        
        self.view.addSubview(adlabel)
        self.adlabel = adlabel
        
        //Button
        var button = UIButton()
        button.frame = CGRectMake(150, 250, 60, 60)
        button.setTitle("Click", forState: .Normal)
        button.setTitleColor(UIColor.blueColor(), forState: .Normal)
        self.view.addSubview(button)
        
        button.addTarget(self, action: "incrementCount", forControlEvents: UIControlEvents.TouchUpInside)
    }
    
    func incrementCount(){
        self.count++
        self.label.text = "\(self.count)"
        self.adlabel.text = "\(self.count)"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

