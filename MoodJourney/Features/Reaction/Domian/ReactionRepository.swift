//
//  ReactionRepository.swift
//  MoodJourney
//
//  Created by Keyvan on 2/22/23.
//

import Foundation

protocol ReactionRepository {
    func addReaction(_ reaction: ReactionEntity,to feeling: FeelingEntity) -> Result<ReactionEntity,Error>
}
