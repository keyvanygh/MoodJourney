//
//  File.swift
//  MoodJourney
//
//  Created by Keyvan on 2/15/23.
//

import Foundation

protocol SigninRepository {
    
    /// Signin using  **3'rd Party**
    /// - Parameters:
    ///   - thirdParty: 3'rd party type e.g: .Google
    ///   - userID: userID provided by 3'rd party
    ///   - name: name provided by 3'rd party
    ///   - hasImage if user has an image or not
    ///   - family: last name provided by 3'rd party
    ///   - givenName: given name provided by 3'rd party
    ///   - imageURL: user image url
    func signin(
        withThirdParty thirdParty: ThirdParty,
        userID : String,hasImage : Bool?,
        name : String?,family : String?,
        givenName : String?,imageURL : URL?) -> Result<UserEntity,Error>
}

enum ThirdParty{
    case Google,Apple,Meta
}