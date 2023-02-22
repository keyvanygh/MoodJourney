//
//  FeelingLocalDataSource.swift
//  MoodJourney
//
//  Created by Keyvan on 2/17/23.
//

import Foundation
import Factory

class FeelingLocalDatasource {
    @Injected(Container.dbm) private var dbm
    
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
}
