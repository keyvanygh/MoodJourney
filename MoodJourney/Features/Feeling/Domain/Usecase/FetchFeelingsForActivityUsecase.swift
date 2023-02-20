//
//  FetchFeelingsForActivityUsecase.swift
//  MoodJourney
//
//  Created by Keyvan on 2/18/23.
//

import Foundation

/// fetch feelings submited in an activity
class FetchFeelingsForActivityUsecase {
    let repository : FeelingRepository
    init(repository: FeelingRepository) {
        self.repository = repository
    }
    /// execute the usecae
    /// - Parameters:
    ///   - activityID: activity id
    /// - Returns:
    ///   - success: array of FeelingEntitys
    ///   - fail: FeelingError
    func execute(activityID: String) -> Result<[FeelingEntity],Error> {
        return repository.fetchFeelings(fromActivity: activityID)
    }
}
