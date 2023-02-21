//
//  ActivityLocalDatasource.swift
//  MoodJourney
//
//  Created by Keyvan on 2/18/23.
//

import Foundation
import Factory

class ActivityLocalDatasource {
    
    @Injected(Container.dbm) private var dbm
    
    /// add activity to db
    /// - Parameters:
    ///   - activityID: activity id
    ///   - name: activity name
    ///   - imageURLString: activity image url absoluteString
    /// - Returns:
    ///   - success: created activity
    /// - Throws:
    ///   - ActivityError
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
    
    /// fetch all activities
    /// - Returns:
    ///   - success: list of activities
    /// - Throws:
    ///   - ActivityError
    func fetchActivies() throws -> [ActivityEntity]{
        guard let result = try dbm.fetch(entity: .Activity) as? [ActivityEntity] else {throw(AnyError.error)}
        return result
    }
}
