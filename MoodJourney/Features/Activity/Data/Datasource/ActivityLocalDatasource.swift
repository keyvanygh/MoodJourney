//
//  ActivityLocalDatasource.swift
//  MoodJourney
//
//  Created by Keyvan on 2/18/23.
//

import Foundation


class ActivityLocalDatasource {
    
    let dbm = LocalDatabaseManager()
    func addActivity(
        activityID: String,
        name: String,
        imageURLString: String? = nil) throws -> ActivityEntity {
        guard let entitiy = dbm.add(entity: .Activity) as? ActivityEntity else {throw(URLError(.badURL))}
        entitiy.name = name
        entitiy.activityID = activityID
        entitiy.internalID = UUID()
        entitiy.imageURLString = imageURLString
        try dbm.save()
        return entitiy
    }
    
    func fetchActivies() throws -> [ActivityEntity]{
        guard let result = try dbm.fetch(entity: .Activity) as? [ActivityEntity] else {throw(AnyError.error)}
        return result
    }
}
