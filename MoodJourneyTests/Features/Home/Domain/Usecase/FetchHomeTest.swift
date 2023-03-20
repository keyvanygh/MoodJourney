//
//  FetchHomeTest.swift
//  MoodJourneyTests
//
//  Created by Keyvan on 3/19/23.
//

import XCTest
@testable import MoodJourney

final class FetchHomeTest: XCTestCase {

    func test_reciveHome_whenFetchHomeSuccess() throws {
        var mockRepository = MockHomeRepository()
        let feelings = try XCTUnwrap(FeelingEntity.someFeelings)
        let user = try XCTUnwrap(UserEntity.testUser)
        mockRepository.answerWith(feelings)
        let sut = FetchHome(repository: mockRepository)
        let result = sut(of: user)
        switch result {
        case .success(let feelings):
            XCTAssert(!feelings.isEmpty)
        case .failure: XCTFail("Failed")
        }
    }
    
}
class MockHomeRepository: AnyMock, HomeRepository {
    var answer: Any?
    
    func fetchHome(of user: UserEntity) -> Result<[FeelingEntity], Error> {
        return answer(Result<[FeelingEntity], Error>.self)
    }
}
