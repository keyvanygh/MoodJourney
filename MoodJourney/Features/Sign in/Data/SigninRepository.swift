//
//  Repository.swift
//  MoodJourney
//
//  Created by Keyvan on 2/16/23.
//

import Foundation

class SigninRepository : ISigninRepository {
    let thirdPartyRemoteDataSource : ThirdPartySigninRemoteDataSource
    init(thirdPartyRemoteDataSource: ThirdPartySigninRemoteDataSource) {
        self.thirdPartyRemoteDataSource = thirdPartyRemoteDataSource
    }
    
    func signin(
        withThirdParty thirdParty: ThirdParty,
        userID: String, hasImage: Bool?,
        name: String?, family: String?,
        givenName: String?,
        imageURL: URL?) -> Result<UserEntity, Error> {
        return .failure(AnyError.error)
    }
    
}
