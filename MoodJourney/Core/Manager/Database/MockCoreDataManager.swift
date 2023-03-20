//
//  MockDatabaseManager.swift
//  MoodJourney
//
//  Created by Keyvan on 3/8/23.
//

import Foundation
import CoreData

class MockCoreDataManager: CoreDataManager {
    static let shared = MockCoreDataManager()
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
    lazy var previewUser2: UserEntity? = {
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
    lazy var activityWithFeeling: ActivityEntity? = {
        guard let activity = add(entity: .activity) as? ActivityEntity else {return nil}
        activity.name = "TestActivityName"
        activity.activityID = "TestActivityID"
        activity.imageURLString = "https://www.healthkart.com/connect/wp-content/uploads/2021/03/banner.jpg"
        guard let feeling = add(entity: .feeling) as? FeelingEntity else {return nil}
        feeling.message = "testFeeling"
        feeling.feelingTypeValue = Feeling.happy.rawValue
        activity.addToFeelings(feeling)
        return activity
    }()
    lazy var activityWithNoFeeling: ActivityEntity? = {
        guard let activity = add(entity: .activity) as? ActivityEntity else {return nil}
        activity.name = "TestActivityName"
        activity.activityID = "TestActivityID"
        activity.imageURLString = "https://www.healthkart.com/connect/wp-content/uploads/2021/03/banner.jpg"
        return activity
    }()
    
    lazy var someFeelings: [FeelingEntity] = {
        var feelings: [FeelingEntity] = []
        guard let feeling = add(entity: .feeling) as? FeelingEntity else {return []}
        feeling.message = "Message1"
        feeling.feelingTypeValue = Feeling.happy.rawValue
        feelings.append(feeling)
        guard let feeling2 = add(entity: .feeling) as? FeelingEntity else {return []}
        feeling.message = "Message2"
        feeling.feelingTypeValue = Feeling.sad.rawValue
        feelings.append(feeling2)
        return feelings
    }()
    lazy var reaction: ReactionEntity? = {
        guard let reaction = add(entity: .reaction) as? ReactionEntity else {return nil}
        return reaction
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
    
    func addSomeActivities() {
        let newActivity = add(entity: .activity) as? ActivityEntity
        newActivity?.name = "activity"
        let newActivity2 = add(entity: .activity) as? ActivityEntity
        newActivity2?.name = "activity2"
    }
    
}
