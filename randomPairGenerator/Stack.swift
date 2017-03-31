//
//  Stack.swift
//  randomPairGenerator
//
//  Created by Angela Montierth on 3/31/17.
//  Copyright © 2017 Angela Montierth. All rights reserved.
//

import Foundation
import CoreData


class Stack {
    
    static let container: NSPersistentContainer = {
        
        let container = NSPersistentContainer(name: "randomPairGenerator")
        container.loadPersistentStores() { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        }
        return container
    }()
    
    static var context: NSManagedObjectContext { return container.viewContext }
    
    
}
