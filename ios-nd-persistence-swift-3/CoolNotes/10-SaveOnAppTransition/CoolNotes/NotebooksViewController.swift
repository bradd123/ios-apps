//
//  NotebooksViewController.swift
//  CoolNotes
//
//  Created by Fernando Rodríguez Romero on 10/03/16.
//  Copyright © 2016 udacity.com. All rights reserved.
//

import UIKit
import CoreData

// MARK: - NotebooksViewController: CoreDataTableViewController

class NotebooksViewController: CoreDataTableViewController {
    
    // MARK: Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set the title
        title = "CoolNotes"
        
        // Get the stack
        let delegate = UIApplication.shared.delegate as! AppDelegate
        let stack = delegate.stack
        
        // Create a fetchrequest
        let fr = NSFetchRequest<NSFetchRequestResult>(entityName: "Notebook")
        fr.sortDescriptors = [NSSortDescriptor(key: "name", ascending: true),
                              NSSortDescriptor(key: "creationDate", ascending: false)]
        
        // Create the FetchedResultsController
        fetchedResultsController = NSFetchedResultsController(fetchRequest: fr, managedObjectContext: stack.context, sectionNameKeyPath: nil, cacheName: nil)
    }
    
    // MARK: Actions
    
    @IBAction func addNewNotebook(_ sender: AnyObject) {
        // Create a new notebook... and Core Data takes care of the rest!
        let nb = Notebook(name: "New Notebook", context: fetchedResultsController!.managedObjectContext)
        print("Just created a notebook: \(nb)")
    }
    
    // MARK: TableView Data Source
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // This method must be implemented by our subclass. There's no way
        // CoreDataTableViewController can know what type of cell we want to
        // use.
        
        // Find the right notebook for this indexpath
        let nb = fetchedResultsController!.object(at: indexPath) as! Notebook
        
        // Create the cell
        let cell = tableView.dequeueReusableCell(withIdentifier: "NotebookCell", for: indexPath)
        
        // Sync notebook -> cell
        cell.textLabel?.text = nb.name
        cell.detailTextLabel?.text = String(format: "%d notes", nb.notes!.count)
        
        return cell
    }
    
    // MARK: Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        if segue.identifier! == "displayNote" {
            
            if let notesVC = segue.destination as? NotesViewController {
                
                // Create Fetch Request
                let fr = NSFetchRequest<NSFetchRequestResult>(entityName: "Note")
                
                fr.sortDescriptors = [NSSortDescriptor(key: "creationDate", ascending: false),NSSortDescriptor(key: "text", ascending: true)]
                
                // So far we have a search that will match ALL notes. However, we're
                // only interested in those within the current notebook:
                // NSPredicate to the rescue!
                let indexPath = tableView.indexPathForSelectedRow!
                let notebook = fetchedResultsController?.object(at: indexPath)
                
                let pred = NSPredicate(format: "notebook = %@", argumentArray: [notebook!])
                
                fr.predicate = pred
                
                // Create FetchedResultsController
                let fc = NSFetchedResultsController(fetchRequest: fr, managedObjectContext:fetchedResultsController!.managedObjectContext, sectionNameKeyPath: nil, cacheName: nil)
                
                // Inject it into the notesVC
                notesVC.fetchedResultsController = fc
            }
        }
    }
}
