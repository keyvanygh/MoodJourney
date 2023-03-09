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
    
    var lds = 0
    
    var rds = 0
    
    func fetchActivities() -> Result<[ActivityEntity], Error> {
        guard let answer = answer as? [ActivityEntity] else {return .failure(AnyError.error)}
        return .success(answer)
    }
    
    func setAnswer(_ answer: Any?) {
        self.answer = answer
    }
}
