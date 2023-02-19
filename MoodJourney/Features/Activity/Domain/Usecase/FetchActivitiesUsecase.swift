//
//  FetchActivitiesUsecase.swift
//  MoodJourney
//
//  Created by Keyvan on 2/18/23.
//

import Foundation

class FetchActivitiesUsecase {
    let repository: ActivityRepository
    init(repository: ActivityRepository) {
        self.repository = repository
    }
    func execute() -> Result<[ActivityEntity],Error> {
        return .success(repository.fetchActivities())
    }
}
