//
//  IMoodRepository.swift
//  MoodJourney
//
//  Created by Keyvan on 2/16/23.
//

import Foundation

protocol FeelingRepository {
    func addFeeling(activityID: String,feeling: Feelings) -> Result<Bool,Error>
}
