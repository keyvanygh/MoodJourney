//
//  ReactionView.swift
//  MoodJourney
//
//  Created by Keyvan on 2/22/23.
//

import Foundation
import Factory

class ReactionViewModel: ObservableObject {
    @Injected(\.addReactionToFeelingUsecase)
    private var addReactionToFeelingUsecase: AddReactionToFeelingUsecase
    
    func addReaction(gifURL: URL?, emoji: String?, to feeling: FeelingEntity) {
        addReactionToFeelingUsecase.execute(gifURL: gifURL, emoji: emoji, to: feeling)
    }
    
}
