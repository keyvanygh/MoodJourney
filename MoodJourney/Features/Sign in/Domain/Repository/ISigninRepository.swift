//
//  File.swift
//  MoodJourney
//
//  Created by sh on 2/15/23.
//

import Foundation

protocol ISinginRepository {
    
    func signin(withThirdParty thirdParty: ThirdParty,
                userID : String,hasImage : Bool?,
                name : String?,family : String?,
                givenName : String?,mageURL : URL?)
}

enum ThirdParty{
    case Google,Apple,Meta
}
