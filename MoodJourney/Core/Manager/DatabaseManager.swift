//
//  LocalDatabaseManager.swift
//  MoodJourney
//
//  Created by Keyvan on 2/18/23.
//

import Foundation
import CoreData

class DatabaseManager: CoreDataManager {
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
public enum Entity: String {
    case activity = "ActivityEntity"
    case feeling = "FeelingEntity"
    case user = "UserEntity"
    case reaction = "ReactionEntity"
}

class TestCoreData: CoreDataManager {
    static let shared = TestCoreData()
    lazy var previewUser: UserEntity? = {
        guard let user = add(entity: .user) as? UserEntity else {return nil}
        user.userID = "TestUser"
        user.imageURLString = "TestUser"
        user.name = "TestUserName"
        user.familyName = "TestUserFamilyName"
        user.signedWith = "google"
        guard let activity = add(entity: .activity) as? ActivityEntity else {return nil}
        activity.name = "TestActivityName"
        activity.activityID = "TestActivityID"
        activity.imageURLString = "https://www.healthkart.com/connect/wp-content/uploads/2021/03/banner.jpg"
        return user
    }()
    lazy var previewActivities: [ActivityEntity] = {
        var activities: [ActivityEntity] = []
        guard let activity = add(entity: .activity) as? ActivityEntity else {return []}
        activity.name = "TestActivityName"
        activity.activityID = "TestActivityID"
        activity.imageURLString = "https://www.healthkart.com/connect/wp-content/uploads/2021/03/banner.jpg"
        activities.append(activity)
        guard let activity2 = add(entity: .activity) as? ActivityEntity else {return []}
        activity2.name = "TestActivityName2"
        activity2.activityID = "TestActivityID2"
        activity2.imageURLString =
        "https://www.healthcanal.com/wp-content/uploads/how-to-lose-weight-without-losing-boobs.jpg"
        activities.append(activity2)
        return activities
    }()
    lazy var container: NSPersistentContainer = {
        let description = NSPersistentStoreDescription()
        description.url = URL(fileURLWithPath: "/dev/null")
        let container = NSPersistentContainer(name: "LocalDatabase")
        container.persistentStoreDescriptions = [description]
        container.loadPersistentStores { _, error in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        }
        return container
    }()
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

protocol CoreDataManager {
    func fetch(entity: Entity) throws -> [NSFetchRequestResult]
    func add(entity: Entity) -> NSManagedObject
    func save() throws
}
