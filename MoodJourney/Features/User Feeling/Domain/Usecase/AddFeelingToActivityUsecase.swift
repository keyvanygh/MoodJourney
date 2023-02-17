//
//  AddMoodUsecase.swift
//  MoodJourney
//
//  Created Keyvan sh on 2/16/23.
//

import Foundation

class AddFeelingToActivityUsecase {
    let repository : FeelingRepository
    init(repository: FeelingRepository) {
        self.repository = repository
    }
    func execute(
        activity: ActivityEntity,
        feeling: Feeling,
        message: String) {
            repository.addFeeling(
                toActivity : activity,
                feeling: FeelingEntity(feeling: feeling,message: message))
        }
}
