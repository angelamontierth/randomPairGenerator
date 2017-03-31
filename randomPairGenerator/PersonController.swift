//
//  PersonController.swift
//  randomPairGenerator
//
//  Created by Angela Montierth on 3/31/17.
//  Copyright © 2017 Angela Montierth. All rights reserved.
//

import Foundation
import CoreData

class PersonController {
    
    let moc = Stack.context
    
    static let sharedController = PersonController()
    
    // CREATE
    
    func addName(name: String) {
        
        let _ = Person(name: name)
        saveToPersistentStore()
        
    }
    
    
    // READ
    
    var people: [Person] {
        let request: NSFetchRequest<Person> = Person.fetchRequest()
        do {
            return try moc.fetch(request)
        } catch {
            return []
        }
    }

    
    // SAVE

    func saveToPersistentStore() {
    
        do {
            try moc.save()
        } catch {
            print("Cannot save to presistent store")
        }

    }
    
    
    func randomize(people: [Person]) -> [Person] {
        
        let randomIndex = Int(arc4random_uniform(UInt32(people.count)))
        return ([people[randomIndex]])
        saveToPersistentStore()
        
    }
    
    
    
}


































