//
//  IMoodRepository.swift
//  MoodJourney
//
//  Created by Keyvan on 2/16/23.
//

import Foundation

protocol FeelingRepository {
    func addFeeling(activityID: String,feeling: Feelings,message: String?, imageURLString: String?) -> Result<Bool,Error>
    func fetchFeelings(fromActivity activityID: String) -> Result<[FeelingEntity],Error>
}
