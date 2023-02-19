//
//  FeelingLocalDataSource.swift
//  MoodJourney
//
//  Created by Keyvan on 2/17/23.
//

import Foundation

class FeelingLocalDatasource {
    let dbm = LocalDatabaseManager()
    
    func addFeeling(
        toActicity activityID: String,
        feeling: String,message: String,
        imageURLString: String) throws -> FeelingEntity {
            guard let entitiy = dbm.add(entity: .Feeling) as? FeelingEntity else {throw(URLError(.badURL))}
            entitiy.message = message
            entitiy.activityID = activityID
            entitiy.feelingType = feeling
            entitiy.date = Date()
            try dbm.save()
            return entitiy
        }
    
    func fetchFeelings() throws -> [FeelingEntity] {
        guard var fetchResutl = try dbm.fetch(entity: .Feeling) as? [FeelingEntity] else{return []}
        fetchResutl.sort(by:{$0.date ?? Date() < $1.date ?? Date()})
        return fetchResutl
        
    }
}
