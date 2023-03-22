//
//  FeelingLocalDataSource.swift
//  MoodJourney
//
//  Created by Keyvan on 2/17/23.
//

import Foundation
import Factory

class FeelingLocalDatasourceImp: FeelingLocalDatasource {
    private var dbm: CoreDataManager
    private var acm: AccountManager
    
    init(dbm: CoreDataManager, acm: AccountManager) {
        self.dbm = dbm
        self.acm = acm
    }
    
    /// add feeling to activity with acitivtyID
    /// - Parameters:
    ///   - to : acticity
    ///   - feeling: feeling
    ///   - message: some explanation for the feeling
    ///   - imageURLString: image url absoluteString
    /// - Returns:
    ///   - success: array of FeelingEntitys
    /// - Throws:
    ///   - FeelingError
    func addFeeling(
        feeling: String, message: String?,
        imageURLString: String?, to activity: ActivityEntity) throws -> FeelingEntity {
            guard let feelingEntitiy = dbm.add(entity: .feeling) as? FeelingEntity
            else {throw(URLError(.badURL))}
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
    ///   - of: activity
    /// - Returns:
    ///   - success: array of FeelingEntitys
    /// - Throws:
    ///   - FeelingError
    func fetchFeelings(of activity: ActivityEntity) throws -> [FeelingEntity] {
        guard var fetchResutl = activity.feelings?.allObjects as? [FeelingEntity]
        else {throw(AnyError.error)}
        fetchResutl
            .sort(by: {$0.date ?? Date() < $1.date ?? Date()})
        return fetchResutl
    }
}
protocol FeelingLocalDatasource {
    func fetchFeelings(of activity: ActivityEntity) throws -> [FeelingEntity]
    func addFeeling(
        feeling: String,
        message: String?,
        imageURLString: String?,
        to activity: ActivityEntity) throws -> FeelingEntity
}
