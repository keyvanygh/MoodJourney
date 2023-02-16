//
//  ThridPartySigninUsecase.swift
//  MoodJourney
//
//  Created by Keyvan on 2/15/23.
//

import Foundation

class ThirdPartySigninUsecase{
    let repository : ISigninRepository
    
    init(repository: ISigninRepository) {
        self.repository = repository
    }
    
    func execute(
        userID : String,hasImage : Bool?,
        name : String?,family : String?,
        givenName : String?,mageURL : URL?) {
            return UserEntity(hasImage: true, userID: "")
    }
}
