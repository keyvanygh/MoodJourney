//
//  MockActivityRepository.swift
//  MoodJourneyTests
//
//  Created by Keyvan on 3/8/23.
//

import Foundation
@testable import MoodJourney

class MockActivityRepository: ActivityRepository, Mock {
   
    var answer: Any?
    
    func fetchActivities() -> FetchActivitiesResult {
        return answer(FetchActivitiesResult.self)
    }
    
    func setAnswer(_ answer: Any?) {
        self.answer = answer
    }
}
