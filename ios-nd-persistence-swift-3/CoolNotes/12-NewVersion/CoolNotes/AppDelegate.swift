//
//  AppDelegate.swift
//  CoolNotes
//
//  Created by Fernando Rodríguez Romero on 09/03/16.
//  Copyright © 2016 udacity.com. All rights reserved.
//

import UIKit

// MARK: - AppDelegate: UIResponder, UIApplicationDelegate

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    // MARK: Properties
    
    var window: UIWindow?
    let stack = CoreDataStack(modelName: "Model")!
    
    // MARK: Preload Data
    
    func preloadData() {
        
        // Remove previous stuff (if any)
        do {
            try stack.dropAllData()
        } catch {
            print("Error droping all objects in DB")
        }
        
        // Create notebooks
        let codeNotes = Notebook(name: "Coding Notes", context: stack.context)
        let appIdeas  = Notebook(name: "Ideas for new Apps", context: stack.context)
        
        // Check out the "data" field when you print an NSManagedObject subclass.
        // It looks like a Dictionary and the values in it are called
        // _Modelled Properties_. These are the properties defined in the
        // Data Model. They reside in the SQLite DB
        print(codeNotes)
        print(appIdeas)
        
        // Create Notes
        let wwdc = Note(text: "Watch some WWDC sessions", context: stack.context)
        let kitura = Note(text: "Learn about Kitura, a web framework in Swift by IBM", context: stack.context)
        
        // When you print any of these notes, you should notice that the notebook
        // relationship is nil. We explicitly forbid this in the Data Model, so
        // what's going on???
        // Core Data validations only kick in when you try to save a context, and
        // we haven't done that so far. If we try to save right now, we would get
        // a crash.
        print(wwdc)
        print(kitura)
        
        // Let's set the notebook property of those 2 notes
        wwdc.notebook = codeNotes
        kitura.notebook = codeNotes
        
        // Wait a minute! Should you also set the notes property in codeNotes?
        // NO! There's no need for that. Since we gave Core Data both relationships
        // (notes and notebook), whenever we make a change on one side, does the
        // appropriate change on the other one.
        // Play around with this, by adding a new note to codeNotes, remove it
        // and check if evertyhing is in sync.
        // See how Core data automates managing your model objects? :-)
        
        // Let's now add note to ideas
        let daDump = Note(text: "daDump: social network for people using the toilet", context: stack.context)
        daDump.notebook = appIdeas
        
        // Search
    }
    
    // MARK: UIApplicationDelegate
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Load some notebooks and notes.
        preloadData()
        // Start Autosaving
        stack.autoSave(60)
        return true
    }
    
    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
        do {
            try stack.saveContext()
        } catch {
            print("Error while saving.")
        }
    }
    
    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
        do {
            try stack.saveContext()
        } catch {
            print("Error while saving.")
        }
    }
}
