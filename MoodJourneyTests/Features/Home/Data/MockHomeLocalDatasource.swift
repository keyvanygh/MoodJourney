//
//  MockHomeLocalDatasource.swift
//  MoodJourneyTests
//
//  Created by Keyvan on 3/22/23.
//

import Foundation
@testable import MoodJourney

class MockHomeLocalDatasource: HomeLocalDatasource, AnyMock {
    func fetchHome(for user: UserEntity) throws -> [FeelingEntity] {
        return try answer([FeelingEntity].self)
    }
    var answer: Any?
}
