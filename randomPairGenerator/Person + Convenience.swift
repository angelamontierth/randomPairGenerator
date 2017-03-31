//
//  Person + Convenience.swift
//  randomPairGenerator
//
//  Created by Angela Montierth on 3/31/17.
//  Copyright © 2017 Angela Montierth. All rights reserved.
//

import Foundation
import CoreData

extension Person {
    
    @discardableResult convenience init(name: String, context: NSManagedObjectContext = Stack.context) {
        
        self.init (context: context)
        self.name = name
    }
    
}
