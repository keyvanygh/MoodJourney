//
//  FetchUserByIDTest.swift
//  MoodJourneyTests
//
//  Created by Keyvan on 3/19/23.
//

import XCTest
@testable import MoodJourney

final class FetchUserByIDTest: XCTestCase {
    
    func test_getUser_whenFetchUserByIDSucsseed() throws {
        var mockRepository = MockSigninRepository()
        let user = try XCTUnwrap(UserEntity.testUser)
        mockRepository.answerWith(user)
        let sut = FetchUserByID(repository: mockRepository)
        let userID = try XCTUnwrap(UserEntity.testUser?.userID)
        let result = sut(userID: userID)
        switch (result) {
        case .success(let user):
            XCTAssertEqual(userID, user.userID)
        case .failure:
            XCTFail("Failed")
        }
    }
    
}
