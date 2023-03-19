//
//  FetchCheerleadersTest.swift
//  MoodJourneyTests
//
//  Created by Keyvan on 3/18/23.
//

import Foundation
import XCTest
@testable import MoodJourney

final class FetchCheerleadersTest: XCTestCase {
    
    func test_reciveCheerleaders_whenFetchCheerleadersSucceed() throws {
        var mockedRepository = MockCheerleadersRepository()
        mockedRepository.answerWith([UserEntity.testUser])
        let sut: FetchCheerleaders = sut(repository: mockedRepository)
        let user = try XCTUnwrap(UserEntity.testUser)
        let result = sut(of: user)
        switch(result) {
        case .success(let cheerleaders):
            XCTAssert(!cheerleaders.isEmpty)
        case .failure:
            XCTFail("Failed")
        }
    }
    
    // MARK: - Helpers
    func sut(repository: CheerleadersRepository) -> FetchCheerleaders {
        return FetchCheerleaders(repository: repository)
    }
}
