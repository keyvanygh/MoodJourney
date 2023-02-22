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
        _ reaction: ReactionEntity,
        to feeling: FeelingEntity) throws -> ReactionEntity {
            guard let reaction = dbm.add(entity: .Reaction) as? ReactionEntity else {throw(AnyError.error)}
            reaction.feeling = feeling
            reaction.gifUrlString = "gifURL.absoluteURL"
            reaction.emoji = "emoji"
            return reaction
//            feeling.addToReactions(reaction)
    }
}
