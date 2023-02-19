//
//  ActivityRepository.swift
//  MoodJourney
//
//  Created by Keyvan on 2/18/23.
//

import Foundation

protocol ActivityRepository {
    func fetchActivities() -> Result<[ActivityEntity],Error>
}
