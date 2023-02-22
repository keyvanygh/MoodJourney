//
//  ReactionLocalDatasource.swift
//  MoodJourney
//
//  Created by Keyvan on 2/22/23.
//

import Foundation
import Factory

class ReactionLocalDatasource {
    @Injected(Container.dbm) private var dbm: DatabaseManager
    
    func addReaction(
        gifURL: URL?,emoji: String?,
        to feeling: FeelingEntity) throws -> ReactionEntity {
            guard let reaction = dbm.add(entity: .Reaction) as? ReactionEntity else {throw(AnyError.error)}
            reaction.gifUrlString = gifURL?.absoluteString
            reaction.emoji = emoji
            feeling.addToReactions(reaction)
//            feeling.addToReactions(reaction)
            return reaction
    }
}
