//
//  ReactionEntity+extension.swift
//  MoodJourneyTests
//
//  Created by Keyvan on 3/19/23.
//

import Foundation
@testable import MoodJourney

extension ReactionEntity {
    static var reaction: ReactionEntity? = {
        return MockCoreDataManager.shared.reaction
    }()
}
 
