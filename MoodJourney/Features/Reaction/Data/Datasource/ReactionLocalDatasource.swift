//
//  ReactionLocalDatasource.swift
//  MoodJourney
//
//  Created by Keyvan on 2/22/23.
//

import Foundation
import Factory

class ReactionLocalDatasource {
    @Injected(\.dbm) private var dbm: CoreDataManager

    func addReaction(
        gifURL: URL?, emoji: String?,
        to feeling: FeelingEntity) throws -> ReactionEntity {
            guard let reaction = dbm.add(entity: .reaction) as? ReactionEntity else {throw(AnyError.error)}
            reaction.gifUrlString = gifURL?.absoluteString
            reaction.emoji = emoji
            feeling.addToReactions(reaction)
            reaction.feeling = feeling
            try dbm.save()
            return reaction
    }
}
