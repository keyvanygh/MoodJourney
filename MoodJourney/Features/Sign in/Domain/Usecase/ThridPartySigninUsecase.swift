//
//  ThridPartySigninUsecase.swift
//  MoodJourney
//
//  Created by Keyvan on 2/15/23.
//

import Foundation

/// will execute this usecase when user sign in with 3'rd party providers e.g: Apple,Google
struct ThirdPartySigninUsecase {
    fileprivate let repository : SigninRepository
    
    init(repository: SigninRepository) {
        self.repository = repository
    }
    
    /// execute the usecae
    /// - Parameters:
    ///   - thirdParty: 3'rd party type e.g: .Google
    ///   - userID: userID provided by 3'rd party
    ///   - name: name provided by 3'rd party
    ///   - hasImage if user has an image or not
    ///   - family: last name provided by 3'rd party
    ///   - givenName: given name provided by 3'rd party
    ///   - imageURL: user image url
    /// - Returns:
    ///   - success: UserEntity
    ///   - fail: SigninError
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
