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
        let mockedRepostiry = MockedRepository()
        let sut = sut(repository: mockedRepostiry)
        let result = sut.execute(
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
    
    // MARK: Helpers
    
    final private func sut(repository : ISigninRepository) -> ThirdPartySigninUsecase {
        return ThirdPartySigninUsecase(repository : repository)
    }
    
    class MockedRepository : ISigninRepository{
        func signin(
            withThirdParty thirdParty: MoodJourney.ThirdParty,
            userID: String,
            hasImage: Bool?,
            name: String?,
            family: String?,
            givenName: String?,
            mageURL: URL?) -> Result<UserEntity,Error> {
                return .success(UserEntity(hasImage: true, userID: ""))
        }
        
        
    }
}
