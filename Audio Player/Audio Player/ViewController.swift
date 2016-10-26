//
//  ViewController.swift
//  Audio Player
//
//  Created by Brahma Reddy Chilakala on 26/10/16.
//  Copyright © 2016 Brahma Reddy Chilakala. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var player = AVAudioPlayer()

    @IBAction func play(_ sender: AnyObject) {
        
        player.play()
        
    }
    
    @IBAction func pause(_ sender: AnyObject) {
        
        player.pause()
        
    }
    
    @IBAction func sliderMoved(_ sender: AnyObject) {
        
        player.volume = slider.value
        
    }
    
    @IBOutlet var slider: UISlider!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let audioPath = Bundle.main.path(forResource: "hunters", ofType: "mp3")
        
        do {
            
            try player = AVAudioPlayer(contentsOf: URL(fileURLWithPath: audioPath!))
            
        } catch {
            
            // Process any errors
            
        }
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

