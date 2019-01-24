//
//  UIViewController+Extension.swift
//  Tracker
//
//  Created by Волнухин Виктор on 24/01/2019.
//

import UIKit
import CoreData


extension UIViewController {
    
    var context: NSManagedObjectContext {
        get {
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            return appDelegate.persistentContainer.viewContext
        }
    }
    
}
