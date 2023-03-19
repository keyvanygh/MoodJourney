//
//  ThirdPartySigninUsecase.swift
//  MoodJourneyTests
//
//  Created by Keyvan on 2/15/23.
//

import XCTest
@testable import MoodJourney

final class SigninWithAppleTest: XCTestCase {
    
    func test_reciveUserEntity_whenAuthIsSuccess() throws {
        var mockedRepostiry =  MockSigninRepository()
        let sut:SigninWithApple = sut(repository: mockedRepostiry)
        
        let testUser = try XCTUnwrap(UserEntity.testUser)
        let userID = try XCTUnwrap(testUser.userID)

        mockedRepostiry
            .answerWith(testUser)
        
        let result = sut(userID : userID)
        
        switch(result) {
        case .success(let userEntity):
            XCTAssertEqual(userEntity, UserEntity.testUser)
        default:
            XCTFail("failed")
        }
    }
    
    func test_reciveError_whenAuthIsFailed() throws {
        var mockedSigninRepository =  MockSigninRepository()
        let sut:SigninWithApple = sut(repository: mockedSigninRepository)
        
        let testUser = try XCTUnwrap(UserEntity.testUser)
        let userID = try XCTUnwrap(testUser.userID)
        
        mockedSigninRepository
            .answerWith(AnyError.error)
        
        let result = sut(userID: userID)
        
        switch(result) {
        case .success:
            XCTFail("failed")
            
        default:
            XCTAssert(true)
            
        }
    }
    
    //    // MARK: Helpers:
    final private func sut(repository : any SigninRepository) -> SigninWithApple {
        return SigninWithApple(repository : repository)
    }
}
