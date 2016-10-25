//
//  ViewController.swift
//  Animations
//
//  Created by Brahma Reddy Chilakala on 23/10/16.
//  Copyright © 2016 Brahma Reddy Chilakala. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet var image: UIImageView!
    
    var timer = Timer()
    
    var counter = 1
    
    func animate() {
        
        image.image = UIImage(named: "frame_\(counter)_delay-0.1s.gif")
        
        counter += 1
        
        if counter == 5 {
            counter = 0
        }
    }
    
    @IBAction func fadeIn(_ sender: AnyObject) {
        
        image.alpha = 0
        
        UIView.animate(withDuration: 1, animations: {
            self.image.alpha = 1
        
        })
    }
    
    @IBAction func slideIn(_ sender: AnyObject) {
        
        image.center = CGPoint(x: image.center.x - 500, y: image.center.y)
        
        UIView.animate(withDuration: 2, animations: {
            
            self.image.center = CGPoint(x: self.image.center.x + 500, y: self.image.center.y)
            
        })
        
    }
    @IBAction func start(_ sender: AnyObject) {
        
        timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(ViewController.animate), userInfo: nil, repeats: true)
        
        
    }
    @IBAction func grow(_ sender: AnyObject) {
        
        image.frame = CGRect(x: 0, y: 0, width: 0, height: 0)
        
        UIView.animate(withDuration: 1, animations: {
        
            self.image.frame = CGRect(x: 0, y: 0, width: 200, height: 200)
        
        })
    }
    
    @IBAction func stop(_ sender: AnyObject) {
        
        timer.invalidate()
        
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

