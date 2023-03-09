//
//  ActicityEntity+extension.swift
//  MoodJourneyTests
//
//  Created by Keyvan on 3/8/23.
//

import Foundation
@testable import MoodJourney

extension ActivityEntity {
    static var testActivity: ActivityEntity? {
        return MockCoreDataManager.shared.previewActivities.first
    }
    static var activityWithNoFeeling: ActivityEntity? {
        return MockCoreDataManager.shared.activityWithNoFeeling
    }
    static var activityWithFeeling: ActivityEntity? {
        return MockCoreDataManager.shared.activityWithFeeling
    }
}
