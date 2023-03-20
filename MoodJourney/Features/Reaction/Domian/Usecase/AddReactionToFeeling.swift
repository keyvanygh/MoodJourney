//
//  AddReactionToFeeling.swift
//  MoodJourney
//
//  Created by Keyvan on 2/22/23.
//

import Foundation

class AddReactionToFeeling {
    let repository: ReactionRepository
    init(repository: ReactionRepository) {
        self.repository = repository
    }
    func callAsFunction(gifURL: URL?, emoji: String?, to feeling: FeelingEntity) -> Result<Bool,Error> {
        let result = repository.addReaction(gifURL: gifURL, emoji: emoji, to: feeling)
        switch result {
        case .failure: return .failure(AnyError.error)
        case .success: return .success(true)
        }
        
    }
}
