//
//  AppDelegate.swift
//  SandboxPlayground
//
//  Created by Fernando Rodríguez Romero on 13/05/16.
//  Copyright © 2016 udacity.com. All rights reserved.
//

import UIKit

// MARK: - AppDelegate: UIResponder, UIApplicationDelegate

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    // MARK: Properties
    
    var window: UIWindow?
    
    func sandboxPlayground() {
        let fm = FileManager.default
        let urls = fm.urls(for: .documentDirectory, in: .userDomainMask)
        let url = urls.last?.appendingPathComponent("file.txt")
        
        do {
            try "Hi There!".write(to: url!, atomically: true, encoding: String.Encoding.utf8)
        } catch {
            print("Error while writing")
        }
        
        do {
            let content = try String(contentsOf: url!, encoding: String.Encoding.utf8)
            
            if content == "Hi There!" {
                print("yay")
            } else {
                print("oops")
            }
        } catch {
            print("something went wrong")
        }
    }

    // MARK: UIApplicationDelegate
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        sandboxPlayground()
        return true
    }
}
