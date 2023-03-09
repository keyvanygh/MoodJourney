//
//  FetchActivitiesUsecase.swift
//  MoodJourney
//
//  Created by Keyvan on 2/18/23.
//

import Foundation

/// fetch all activities
class FetchActivities: AnyUsecase {
    let repository: any ActivityRepository
    init(repository: any ActivityRepository) {
        self.repository = repository
    }
    /// execute usecase
    /// - Returns:
    ///   - success: list of activities
    ///   - fail: ActivityError
    func callAsFunction() -> Result<[ActivityEntity], Error> {
        return repository.fetchActivities()
    }
}
