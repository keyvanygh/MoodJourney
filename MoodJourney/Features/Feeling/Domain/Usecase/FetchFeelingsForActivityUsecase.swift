//
//  FetchFeelingsForActivityUsecase.swift
//  MoodJourney
//
//  Created by Keyvan on 2/18/23.
//

import Foundation

class FetchFeelingsForActivityUsecase {
    let repository : FeelingRepository
    init(repository: FeelingRepository) {
        self.repository = repository
    }
    func execute(activityID: String) -> Result<[FeelingEntity],Error> {
        return repository.fetchFeelings(fromActivity: activityID)
    }
}
