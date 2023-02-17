//
//  Repository.swift
//  MoodJourney
//
//  Created by Keyvan on 2/16/23.
//

import Foundation

class SigninRepository : ISigninRepository {
    func signin(withThirdParty thirdParty: ThirdParty, userID: String, hasImage: Bool?, name: String?, family: String?, givenName: String?, imageURL: URL?) -> Result<UserEntity, Error> {
        return .failure(AnyError.error)
    }
    
    
}
