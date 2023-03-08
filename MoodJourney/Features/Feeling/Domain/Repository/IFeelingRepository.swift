//
//  IMoodRepository.swift
//  MoodJourney
//
//  Created by Keyvan on 2/16/23.
//

import Foundation

protocol FeelingRepository: AnyRepository {
    
    /// add feeling to activity with acitivtyID
    /// - Parameters:
    ///   - activityID: activity id
    ///   - feeling: feeling
    ///   - message: some explanation for the feeling
    ///   - imageURLString: image url absoluteString
    /// - Returns:
    ///   - success: array of FeelingEntitys
    ///   - fail: FeelingError
    func addFeeling(
        feeling: Feeling,
        message: String?,
        imageURLString: String?,
        to activity: ActivityEntity) -> Result<Bool, Error>
    
    /// fetch feelings from activity with activityID
    /// - Parameters:
    ///   - activityID: activity id
    /// - Returns:
    ///   - success: array of FeelingEntitys
    ///   - fail: FeelingError
    func fetchFeelings(fromActivity activityID: String) -> Result<[FeelingEntity], Error>
    
    func fetchFeelings(of activity: ActivityEntity) -> Result<[FeelingEntity], Error>
    
}
