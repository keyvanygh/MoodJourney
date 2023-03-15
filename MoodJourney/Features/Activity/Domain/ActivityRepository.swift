//
//  ActivityRepository.swift
//  MoodJourney
//
//  Created by Keyvan on 2/18/23.
//

import Foundation

typealias FetchActivitiesResult = Result<[ActivityEntity], Error>

protocol ActivityRepository: AnyRepository {
    /// fetch all activities
    /// - Returns:
    ///   - success: list of activities
    ///   - fail: ActivityError
    func fetchActivities() -> FetchActivitiesResult
}
