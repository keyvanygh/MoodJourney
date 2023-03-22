//
//  MockFeelingLocalDatasource.swift
//  MoodJourneyTests
//
//  Created by Keyvan on 3/22/23.
//

import Foundation
@testable import MoodJourney

class MockFeelingLocalDatasource: FeelingLocalDatasource , AnyMock {
    func fetchFeelings(of activity: ActivityEntity) throws -> [FeelingEntity] {
        return try answer([FeelingEntity].self)
    }
    
    func addFeeling(feeling: String,
                    message: String?,
                    imageURLString: String?,
                    to activity: ActivityEntity) throws -> FeelingEntity {
        return try answer(FeelingEntity.self)
    }
    var answer: Any?
}
