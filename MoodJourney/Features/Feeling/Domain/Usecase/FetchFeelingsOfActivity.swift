//
//  FetchFeelingsForActivityUsecase.swift
//  MoodJourney
//
//  Created by Keyvan on 2/18/23.
//

import Foundation

/// fetch feelings submited in an activity
class FetchFeelingsOfActivity {
    let repository: any FeelingRepository
    init(repository: any FeelingRepository) {
        self.repository = repository
    }
    /// execute the usecae
    /// - Parameters:
    ///   - of: activity
    /// - Returns:
    ///   - success: array of FeelingEntitys
    ///   - fail: FeelingError
    func callAsFunction(of activity: ActivityEntity) -> Result<[FeelingEntity], Error> {
        return repository.fetchFeelings(of: activity)
    }
}
