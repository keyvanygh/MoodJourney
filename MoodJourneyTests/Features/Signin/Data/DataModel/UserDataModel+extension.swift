//
//  UserDataModel+extension.swift
//  MoodJourneyTests
//
//  Created by Keyvan on 2/26/23.
//

import Foundation
@testable import MoodJourney

extension UserDataModel {
    static var template: Self {
        return UserDataModel(
            userID: "mockUserID",
            signedWith: "Apple",
            name: "mockUserName",
            family: "mockUserFamily",
            imageURLString: "mockUserImageURLString")
    }
}
