//
//  Notebook+CoreDataProperties.swift
//  CoolNotes
//
//  Created by Fernando Rodríguez Romero on 14/04/16.
//  Copyright © 2016 udacity.com. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension Notebook {

    @NSManaged var creationDate: Date?
    @NSManaged var name: String?
    @NSManaged var notes: NSSet?

}
