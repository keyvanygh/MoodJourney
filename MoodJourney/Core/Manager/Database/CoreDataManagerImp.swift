//
//  LocalDatabaseManager.swift
//  MoodJourney
//
//  Created by Keyvan on 2/18/23.
//

import Foundation
import CoreData

class CoreDataManagerImp: CoreDataManager {
    let container = NSPersistentContainer(name: "LocalDatabase")
    init() {
        container.loadPersistentStores { _, error in
            if let error = error {
                print("Core Data failed to load: \(error.localizedDescription)")
            }
        }
    }
    func fetch(entity: Entity) throws -> [NSFetchRequestResult] {
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: entity.rawValue)
        return try container.viewContext.fetch(request)
    }
    
    func add(entity: Entity) -> NSManagedObject {
        return NSEntityDescription.insertNewObject(
            forEntityName: entity.rawValue,
            into: container.viewContext)
    }
    func save() throws {
        self.container.viewContext.mergePolicy = NSMergePolicy.mergeByPropertyObjectTrump
        container.viewContext.automaticallyMergesChangesFromParent = true
        try container.viewContext.save()
    }
}
