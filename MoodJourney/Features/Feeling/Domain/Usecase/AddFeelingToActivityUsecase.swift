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
    /// execute the usecae
    /// - Parameters:
    ///   - activityID: activity id
    ///   - feeling: feeling
    ///   - message: some explanation for the feeling
    ///   - imageURLString: image url absoluteString
    /// - Returns:
    ///   - success: array of FeelingEntitys
    ///   - fail: FeelingError
    func execute(
        feeling: Feeling,
        message: String? = "",
        imageURLString: String? = "",
        to activity: ActivityEntity) -> Result<Bool,Error> {
            
            return repository.addFeeling(
                feeling: feeling,
                message: message,
                imageURLString: imageURLString,
                to: activity)
        }
}
