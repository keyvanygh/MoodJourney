//
//  MockSigninRepository.swift
//  MoodJourneyTests
//
//  Created by Keyvan on 2/27/23.
//

import Foundation
@testable import MoodJourney

class MockSigninRepository: SigninRepository,AnyMock {
    var answer: Any?
        
    @discardableResult
    func signin(
        withThirdParty thirdParty: ThirdParty,
        userID: String,
        hasImage: Bool? = false,
        name: String? = "",
        family: String? = "",
        givenName: String? = "",
        imageURL: URL? = nil) -> Result<UserEntity, Error> {
            return answer(Result<UserEntity, Error>.self)
        }
    
    @discardableResult
    func fetchUser(byID id: String) -> Result<UserEntity, Error> {
        return answer(Result<UserEntity, Error>.self)
    }
    
    @discardableResult
    func fetchUserID() -> Result<String, Error> {
        return answer(Result<String, Error>.self)
    }
}
