//
//  UIViewController+Extension.swift
//  Tracker
//
//  Created by Волнухин Виктор on 24/01/2019.
//

import UIKit
import CoreData


extension UIViewController {
    
    // MARK: - Property
    
    var context: NSManagedObjectContext {
        get {
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            return appDelegate.persistentContainer.viewContext
        }
    }
    
    // MARK: - Functions
    
    func loadContext() -> [Birthday] {
        let fetchRequest = Birthday.fetchRequest() as NSFetchRequest<Birthday>
        do {
            return try context.fetch(fetchRequest)
        }
        catch {
            print("Loading data from context was finished with error: " + error.localizedDescription)
            return []
        }
    }
    
    func saveContext() {
        do {
            try context.save()
        }
        catch {
            print("Saving data to context was finished with error: " + error.localizedDescription)
        }
    }
}
