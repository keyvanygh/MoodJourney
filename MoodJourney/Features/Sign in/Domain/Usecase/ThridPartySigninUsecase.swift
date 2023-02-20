//
//  ThridPartySigninUsecase.swift
//  MoodJourney
//
//  Created by Keyvan on 2/15/23.
//

import Foundation

class ThirdPartySigninUsecase {
    let repository : SigninRepository
    
    init(repository: SigninRepository) {
        self.repository = repository
    }
    
    func execute(
        thirdParty : ThirdParty,
        userID : String,
        hasImage : Bool?,
        name : String?,
        family : String?,
        givenName : String?,
        imageURL : URL?) -> Result<UserEntity,Error> {
            return repository.signin(withThirdParty: .Google, userID: userID, hasImage: hasImage, name: name, family: family, givenName: givenName, imageURL: imageURL)
    }
}
