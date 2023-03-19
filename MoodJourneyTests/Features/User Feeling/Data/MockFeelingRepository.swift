//
//  MockFeelingRepository.swift
//  MoodJourneyTests
//
//  Created by Keyvan on 3/8/23.
//

import Foundation
@testable import MoodJourney

class MockFeelingRepository: FeelingRepository, AnyMock {
    let lds: Int = 0
    let rds: Int = 0

    func setAnswer(_ answer: Any?) {
        self.answer = answer
    }
    var answer: Any?
    
    func addFeeling(
        feeling: Feeling,
        message: String?,
        imageURLString: String?,
        to activity: ActivityEntity
    ) -> Result<Bool, Error> {
        guard let answer = answer as? Result<Bool, Error> else {return .failure(AnyError.error)}
        return answer
    }
    
    func fetchFeelings(fromActivity activityID: String) -> Result<[FeelingEntity], Error> {
        guard let answer = answer as? Result<[FeelingEntity], Error> else {return .failure(AnyError.error)}
        return answer
    }
    
    func fetchFeelings(of activity: MoodJourney.ActivityEntity) -> Result<[FeelingEntity], Error> {
        guard let answer = answer as? Result<[FeelingEntity], Error> else {return .failure(AnyError.error)}
        return answer
    }
    
}
