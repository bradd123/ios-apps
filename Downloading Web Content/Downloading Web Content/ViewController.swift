//
//  ViewController.swift
//  Downloading Web Content
//
//  Created by Brahma Reddy Chilakala on 21/10/16.
//  Copyright © 2016 Brahma Reddy Chilakala. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var webview: UIWebView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        /* let url = URL(string: "https://www.google.co.in/")!
        
        webview.loadRequest(URLRequest(url: url))
        
        webview.loadHTMLString("<h1>Hello World</h1>", baseURL: nil)
        */
        
        let url = URL(string: "https://www.google.co.in/")!
        
        let request = NSMutableURLRequest(url: url)
        
        let task = URLSession.shared.dataTask(with: request as URLRequest) {
            data, reponse, error in
            
            if error != nil {
                print (error)
            } else {
                if let unwrappedData = data {
                    let dataString = NSString(data: unwrappedData, encoding: String.Encoding.utf8.rawValue)
                    
                    print(dataString)
                }
            }
        }
        
        task.resume()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

