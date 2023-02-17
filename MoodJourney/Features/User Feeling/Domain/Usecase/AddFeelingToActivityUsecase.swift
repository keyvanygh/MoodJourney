//
//  AddMoodUsecase.swift
//  MoodJourney
//
//  Created Keyvan Keyvan on 2/16/23.
//

import Foundation

class AddFeelingToActivityUsecase {
    let repository : FeelingRepository
    init(repository: FeelingRepository) {
        self.repository = repository
    }
    func execute(
        activityID: String,
        feeling: Feeling,
        message: String) -> Result<Bool,Error> {
            return repository.addFeeling(
                activityID: activityID,
                feeling: FeelingEntity(feeling: feeling,message: message))
        }
}
