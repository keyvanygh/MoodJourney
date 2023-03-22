//
//  CheerleadersRepositoryImpTest.swift
//  MoodJourneyTests
//
//  Created by Keyvan on 3/22/23.
//

import Foundation
import XCTest
@testable import MoodJourney

class CheerleadersRepositoryImpTest: XCTestCase {
    
    func test_reciveCheerleaders_whenFetchCheerleadersSuccess() throws {
        var mock = MockCheerleadersLocalDatasource()
        let cheerleaders: [UserEntity] = []
        mock.answerWith(cheerleaders)
        let user = try XCTUnwrap(UserEntity.testUser)
        let sut = CheerleadersRepositoryImp(lds: mock)
        let result = sut.fetchCheerleaders(of: user)
        XCTAssert(result.isSuccess)
    }
    func test_reciveError_whenFetchCheerleadersFail() throws {
        var mock = MockCheerleadersLocalDatasource()
        mock.answerWith(AnyError.error)
        let user = try XCTUnwrap(UserEntity.testUser)
        let sut = CheerleadersRepositoryImp(lds: mock)
        let result = sut.fetchCheerleaders(of: user)
        XCTAssert(!result.isSuccess)
    }
}
