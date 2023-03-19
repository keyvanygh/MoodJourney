//
//  UserEntity+extension.swift
//  MoodJourneyTests
//
//  Created by Keyvan on 2/27/23.
//

import Foundation
@testable import MoodJourney
extension UserEntity {
    static var testUser: UserEntity? {
        return MockCoreDataManager.shared.previewUser
    }
    static var testUser2: UserEntity? {
        return MockCoreDataManager.shared.previewUser2
    }
}
