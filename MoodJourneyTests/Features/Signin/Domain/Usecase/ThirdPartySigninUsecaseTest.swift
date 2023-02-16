//
//  ThirdPartySigninUsecase.swift
//  MoodJourneyTests
//
//  Created by Keyvan on 2/15/23.
//

import XCTest
@testable import MoodJourney

final class ThirdPartySigninUsecaseTest: XCTestCase {
    
    func test_reciveUserEntity_whenAuthIsSuccess() {
        let mockedRepostiry = MockedRepository(isSuccess: true)
        let sut = sut(repository: mockedRepostiry)
        let result = sut.execute(
            thirdParty : .Google,
            userID : "String",
            hasImage : false,
            name : "name",
            family : "fname",
            givenName : "gname",
            imageURL : URL(string: "string"))
        switch(result){
        case .success(let userEntity):
            XCTAssertNotNil(userEntity)
        default:
            XCTFail()
        }
    }
    func test_reciveError_whenAuthIsFailed() {
        let mockedRepostiry = MockedRepository(isSuccess: false)
        let sut = sut(repository: mockedRepostiry)
        let result = sut.execute(
            thirdParty : .Google,
            userID : "String",
            hasImage : false,
            name : "name",
            family : "fname",
            givenName : "gname",
            imageURL : URL(string: "string"))
        switch(result){
        case .failure(let error):
            XCTAssert((error is AnyError))
            break
        case .success(_):
            XCTFail()
            break
        }
    }
    
    // MARK: Helpers:
    final private func sut(repository : ISigninRepository) -> ThirdPartySigninUsecase {
        return ThirdPartySigninUsecase(repository : repository)
    }
    
    class MockedRepository : ISigninRepository{
        let isSuccess : Bool
        let successResponse = UserEntity(hasImage: true, userID: "ID")
        
        init(isSuccess: Bool) {
            self.isSuccess = isSuccess
            print("HI IS SUCSess \(isSuccess)")
        }
        
        func signin(
            withThirdParty thirdParty: MoodJourney.ThirdParty,
            userID: String,
            hasImage: Bool?,
            name: String?,
            family: String?,
            givenName: String?,
            imageURL mageURL: URL?) -> Result<UserEntity,Error> {
                if isSuccess {return .success(UserEntity(hasImage: true, userID: ""))}
                else { return .failure(AnyError.error) }
            }
    }
}
