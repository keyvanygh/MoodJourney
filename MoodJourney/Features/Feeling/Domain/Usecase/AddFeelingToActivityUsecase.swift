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
        activityID: String,
        feeling: Feeling,
        message: String? = "",
        imageURLString: String? = "") -> Result<Bool,Error> {
            
            return repository.addFeeling(
                activityID: activityID,
                feeling: feeling,
                message: message,
                imageURLString: imageURLString)
        }
}
