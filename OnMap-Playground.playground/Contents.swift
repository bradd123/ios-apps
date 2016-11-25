//: Playground - noun: a place where people can play

import UIKit
import PlaygroundSupport

PlaygroundPage.current.needsIndefiniteExecution = true

let urlString = "https://www.udacity.com/api/users/3903878747"

let url = URL(string: urlString)
let request = NSMutableURLRequest(url: url!)
let session = URLSession.shared
let task = session.dataTask(with: request as URLRequest) { (data, response, error) in
    if error != nil {
        return
    }
    let range = Range(uncheckedBounds: (5, data!.count - 5))
    let newData = data?.subdata(in: range)
    print(NSString(data: data!, encoding: String.Encoding.utf8.rawValue)!)
}

task.resume()
