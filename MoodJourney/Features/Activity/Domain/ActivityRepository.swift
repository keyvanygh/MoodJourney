//
//  ActivityRepository.swift
//  MoodJourney
//
//  Created by Keyvan on 2/18/23.
//

import Foundation

protocol ActivityRepository: AnyRepository {
    /// fetch all activities
    /// - Returns:
    ///   - success: list of activities
    ///   - fail: ActivityError
    func fetchActivities() -> Result<[ActivityEntity], Error>
}
