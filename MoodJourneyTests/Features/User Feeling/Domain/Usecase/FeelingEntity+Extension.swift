//
//  FeelingEntity+Extension.swift
//  MoodJourneyTests
//
//  Created by Keyvan on 3/8/23.
//

import Foundation
@testable import MoodJourney

extension FeelingEntity {
    static var someFeelings: [FeelingEntity] {
        return MockCoreDataManager.shared.someFeelings
    }
}
