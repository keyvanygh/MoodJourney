//
//  MockReactionLocalDatasource.swift
//  MoodJourneyTests
//
//  Created by Keyvan on 3/22/23.
//

import Foundation
@testable import MoodJourney

class MockReactionLocalDatasource: ReactionLocalDatasource, AnyMock {
    func addReaction(
        gifURL: URL?,
        emoji: String?,
        to feeling: FeelingEntity) throws -> MoodJourney.ReactionEntity {
        return try answer(ReactionEntity.self)
    }
    
    var answer: Any?
}
