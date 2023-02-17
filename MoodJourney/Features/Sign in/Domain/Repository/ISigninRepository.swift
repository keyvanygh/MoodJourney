//
//  File.swift
//  MoodJourney
//
//  Created by Keyvan on 2/15/23.
//

import Foundation

protocol ISigninRepository {
    
    func signin(withThirdParty thirdParty: ThirdParty,
                userID : String,hasImage : Bool?,
                name : String?,family : String?,
                givenName : String?,imageURL : URL?) -> Result<UserEntity,Error>
}

enum ThirdParty{
    case Google,Apple,Meta
}