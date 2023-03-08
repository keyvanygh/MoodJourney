//
//  CoreDataManager.swift
//  MoodJourney
//
//  Created by Keyvan on 3/8/23.
//

import Foundation
import CoreData

protocol CoreDataManager {
    func fetch(entity: Entity) throws -> [NSFetchRequestResult]
    func add(entity: Entity) -> NSManagedObject
    func save() throws
}
