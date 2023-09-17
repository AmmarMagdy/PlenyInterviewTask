//
//  Persistence.swift
//  PlenyInterviewTask
//
//  Created by Ammar.M on 14/09/2023.
//

import CoreData

struct PersistentStore {
    
    static let shared = PersistentStore()
    
    let container: NSPersistentContainer
    
    private init() {
        container = NSPersistentContainer(name: "PlenyInterviewTask")
        container.viewContext.automaticallyMergesChangesFromParent = true
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
    }
    
    var context: NSManagedObjectContext { container.viewContext }
    
    func saveContext () {
        if context.hasChanges {
            do {
                try context.save()
            } catch let error as NSError {
                NSLog("Unresolved error saving context: \(error), \(error.userInfo)")
            }
        }
    }
}
