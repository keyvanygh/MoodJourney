//
//  ThirdParty.swift
//  MoodJourney
//
//  Created by Keyvan on 2/20/23.
//

import Foundation


enum SigninType {
    var rawValue:String {
        switch(self){
        case .PhoneNumber: return "PhoneNumber"
        case .ThirdParty(let thirdParty):
            return thirdParty.rawValue
        }
    }
    case PhoneNumber
    case ThirdParty(ThirdParty)
}
enum ThirdParty: String {
    case Google,Apple,Meta
}
