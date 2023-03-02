//
//  ThirdPartySigninUsecase.swift
//  MoodJourneyTests
//
//  Created by Keyvan on 2/15/23.
//

import XCTest
@testable import MoodJourney

final class ThirdPartySigninUsecaseTest: XCTestCase {
    
    func test_reciveUserEntity_whenAuthIsSuccess() throws {
        let mockedRepostiry =  MockSigninRepository()
        let sut:ThirdPartySigninUsecase = sut(repository: mockedRepostiry)
        
        let testUser = try XCTUnwrap(UserEntity.testUser)
        let userID = try XCTUnwrap(testUser.userID)
        let answer: Result<UserEntity,Error> = .success(testUser)
        
        mockedRepostiry
            .answerWith(answer)
        
        let result = sut.execute(
            thirdParty : .google,
            userID : userID)
        
        switch(result) {
        case .success(let userEntity):
            XCTAssertEqual(userEntity, UserEntity.testUser)
        default:
            XCTFail("failed")
        }
    }
    
    func test_reciveError_whenAuthIsFailed() throws {
        let mockedSigninRepository =  MockSigninRepository()
        let sut = sut(repository: mockedSigninRepository)
        
        let testUser = try XCTUnwrap(UserEntity.testUser)
        let userID = try XCTUnwrap(testUser.userID)
        let answer: Result<UserEntity,Error> = .failure(AnyError.error)
        
        mockedSigninRepository
            .answerWith(answer)
        
        let result = sut.execute(
            thirdParty: .google,
            userID: userID)
        
        switch(result) {
        case .success:
            XCTFail("failed")
            
        default:
            XCTAssert(true)
            
        }
    }
    
    //    // MARK: Helpers:
    final private func sut(repository : SigninRepository) -> ThirdPartySigninUsecase {
        return ThirdPartySigninUsecase(repository : repository)
    }
}
