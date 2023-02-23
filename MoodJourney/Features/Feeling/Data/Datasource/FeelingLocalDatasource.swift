//
//  FeelingLocalDataSource.swift
//  MoodJourney
//
//  Created by Keyvan on 2/17/23.
//

import Foundation
import Factory

class FeelingLocalDatasource {
    @Injected(Container.dbm) private var dbm: DatabaseManager
    @Injected(Container.acm) private var acm: AccountManager
    
    /// add feeling to activity with acitivtyID
    /// - Parameters:
    ///   - activityID: activity id
    ///   - feeling: feeling
    ///   - message: some explanation for the feeling
    ///   - imageURLString: image url absoluteString
    /// - Returns:
    ///   - success: array of FeelingEntitys
    /// - Throws:
    ///   - FeelingError
    func addFeeling(
        toActicity activityID: String,
        feeling: String,message: String?,
        imageURLString: String?) throws -> FeelingEntity {
            guard let entitiy = dbm.add(entity: .Feeling) as? FeelingEntity else {throw(URLError(.badURL))}
            entitiy.message = message
            entitiy.activityID = activityID
            entitiy.feelingTypeValue = feeling
            entitiy.date = Date()
            try dbm.save()
            return entitiy
        }
    func addFeeling(
        feeling: String,message: String?,
        imageURLString: String?,to activity: ActivityEntity) throws -> FeelingEntity {
            guard let feelingEntitiy = dbm.add(entity: .Feeling) as? FeelingEntity else {throw(URLError(.badURL))}
            feelingEntitiy.message = message
            feelingEntitiy.feelingTypeValue = feeling
            feelingEntitiy.date = Date()
            feelingEntitiy.activityID = activity.activityID ?? ""
            if let user = acm.user { feelingEntitiy.user = user }
            activity.addToFeelings(feelingEntitiy)
            try dbm.save()
            return feelingEntitiy
        }
    
    /// fetch feelings from activity with activityID
    /// - Parameters:
    ///   - activityID: activity id
    /// - Returns:
    ///   - success: array of FeelingEntitys
    /// - Throws:
    ///   - FeelingError
    func fetchFeelings(fromActivity activityID: String) throws -> [FeelingEntity] {
        guard var fetchResutl = try dbm.fetch(entity: .Feeling) as? [FeelingEntity] else{return []}
        fetchResutl
            .sort(by:{$0.date ?? Date() < $1.date ?? Date()})
        return fetchResutl.filter({$0.activityID == activityID})
        
    }
    func fetchFeelings(of activity: ActivityEntity) throws -> [FeelingEntity] {
        guard var fetchResutl = activity.feelings?.allObjects as? [FeelingEntity] else{return []}
        fetchResutl
            .sort(by:{$0.date ?? Date() < $1.date ?? Date()})
        return fetchResutl
        
    }
    
#if DEBUG
    //MARK: - HELPER:
    func addFeelingHelper(
        feeling: String,message: String?,
        imageURLString: String?,user: UserEntity,to activity: ActivityEntity) throws -> FeelingEntity {
            guard let feelingEntitiy = dbm.add(entity: .Feeling) as? FeelingEntity else {throw(URLError(.badURL))}
            feelingEntitiy.message = message
            feelingEntitiy.feelingTypeValue = feeling
            feelingEntitiy.date = Date()
            feelingEntitiy.activityID = activity.activityID ?? ""
            feelingEntitiy.user = user
            activity.addToFeelings(feelingEntitiy)
            try dbm.save()
            return feelingEntitiy
        }
#endif
}
