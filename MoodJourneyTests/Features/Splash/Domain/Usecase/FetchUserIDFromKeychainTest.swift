//
//  FetchUserIDFromKeychainTest.swift
//  MoodJourneyTests
//
//  Created by Keyvan on 3/19/23.
//

import XCTest
@testable import MoodJourney

final class FetchUserIDFromKeychainTest: XCTestCase {
    
    func test_getUserID_FetchUserIDFromKeychainSuccessed() throws {
        var mockRepository = MockSigninRepository()
        let user = try XCTUnwrap("userID")
        mockRepository.answerWith(user)
        let sut = FetchUserIDFromKeychain(repository: mockRepository)
        let userID = try XCTUnwrap(UserEntity.testUser?.userID)
        let result = sut()
        switch (result) {
        case .success(let userID):
            XCTAssertEqual(userID, "userID")
        case .failure:
            XCTFail("Failed")
        }
    }
}
