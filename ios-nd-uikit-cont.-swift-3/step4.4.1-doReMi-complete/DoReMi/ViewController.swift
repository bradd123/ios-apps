//
//  ViewController.swift
//  DoReMi
//
//  Created by Jason Schatz on 11/18/14.
//  Copyright (c) 2014 Udacity. All rights reserved.
//

import UIKit

// MARK: - ViewController: UIViewController, UITableViewDataSource

class ViewController: UIViewController, UITableViewDataSource {
    
    // MARK: Properties
    
    // Use this string property as your reuse identifier, 
    // Storyboard has been set up for you using this String.
    let cellReuseIdentifier = "MyCellReuseIdentifier"
    
    // Choose some data to show in your table
    
    let model = [
        ["text" : "Do", "detail" : "A deer. A female deer."],
        ["text" : "Re", "detail" : "A drop of golden sun."],
        ["text" : "Mi", "detail" : "A name, I call myself."],
        ["text" : "Fa", "detail" : "A long long way to run."],
        ["text" : "So", "detail" : "A needle pulling thread."],
        ["text" : "La", "detail" : "A note to follow So."],
        ["text" : "Ti", "detail" : "A drink with jam and bread."]
    ]
    
    // MARK: UITableViewDataSource
    
    // Add the two essential table data source methods here
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.model.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell =  tableView.dequeueReusableCell(withIdentifier: self.cellReuseIdentifier)!
        
        let dictionary = self.model[(indexPath as NSIndexPath).row]
        
        cell.textLabel?.text = dictionary["text"]
        cell.detailTextLabel?.text = dictionary["detail"]
        
        return cell
    }
}
