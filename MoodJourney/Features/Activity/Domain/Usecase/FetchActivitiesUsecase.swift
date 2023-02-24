//
//  FetchActivitiesUsecase.swift
//  MoodJourney
//
//  Created by Keyvan on 2/18/23.
//

import Foundation

/// fetch all activities
class FetchActivitiesUsecase {
    let repository: ActivityRepository
    init(repository: ActivityRepository) {
        self.repository = repository
    }
    /// execute usecase
    /// - Returns:
    ///   - success: list of activities
    ///   - fail: ActivityError
    func execute() -> Result<[ActivityEntity], Error> {
        return repository.fetchActivities()
    }
}
