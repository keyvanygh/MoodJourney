//
//  MockReactionRepository.swift
//  MoodJourneyTests
//
//  Created by Keyvan on 3/19/23.
//

import Foundation
@testable import MoodJourney

class MockReactionRepository: ReactionRepository, AnyMock {
    func addReaction(
        gifURL: URL?,
        emoji: String?,
        to feeling: FeelingEntity) -> Result<ReactionEntity, Error> {
            return answer(Result<ReactionEntity, Error>.self)
    }
    
    var answer: Any?
}
