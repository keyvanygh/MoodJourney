//
//  ThirdParty.swift
//  MoodJourney
//
//  Created by Keyvan on 2/20/23.
//

import Foundation

enum SigninType {
    var rawValue: String {
        switch self {
        case .phoneNumber: return "PhoneNumber"
        case .thirdParty(let thirdParty):
            return thirdParty.rawValue
        }
    }
    case phoneNumber
    case thirdParty(ThirdParty)
}
enum ThirdParty: String {
    case google, apple, meta
}
