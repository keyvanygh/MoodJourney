//
//  ReactionRepository.swift
//  MoodJourney
//
//  Created by Keyvan on 2/22/23.
//

import Foundation

protocol ReactionRepository {
    func addReaction(gifURL: URL?, emoji: String?, to feeling: FeelingEntity) -> Result<ReactionEntity, Error>
}
