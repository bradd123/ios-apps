//
//  ViewController.swift
//  API Demo
//
//  Created by Brahma Reddy Chilakala on 07/11/16.
//  Copyright © 2016 Brahma Reddy Chilakala. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var resultLabel: UILabel!
    @IBOutlet var cityTextField: UITextField!
    @IBAction func submit(_ sender: AnyObject) {
        
        if let url = URL(string: "http://api.openweathermap.org/data/2.5/weather?q=" + cityTextField.text!.replacingOccurrences(of: " ", with: "%20") + "&appid=c1e02540ce319c10b229f7d646963049") {
        
            let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            
                if error != nil {
                    print(error)
                } else {
                    if let urlContent = data {
                        do {
                        
                            let jsonResult = try JSONSerialization.jsonObject(with: urlContent, options: JSONSerialization.ReadingOptions.mutableContainers) as AnyObject
                        
                            print(jsonResult)
                            print(jsonResult["name"])
                            if let description = ((jsonResult["weather"] as? NSArray)?[0] as? NSDictionary)?["description"] as? String {
                            
                                DispatchQueue.main.sync(execute: {
                                    self.resultLabel.text = description
                                })
                            }
                        } catch {
                            print("JSON Processing Failed")
                        }
                    }
                }
            
            }
            task.resume()
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

