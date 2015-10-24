//
//  TaskModel+CoreDataProperties.swift
//  TaskIt
//
//  Created by Rosie  on 10/24/15.
//  Copyright © 2015 Rosie . All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData
@objc(TaskModel)

extension TaskModel {

    @NSManaged var completed: NSNumber?
    @NSManaged var date: NSDate?
    @NSManaged var subtask: String?
    @NSManaged var task: String?

}
