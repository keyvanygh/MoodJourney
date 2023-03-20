//
//  ReactionView.swift
//  MoodJourney
//
//  Created by Keyvan on 2/22/23.
//

import Foundation
import Factory

class ReactionViewModel: ObservableObject {
    @Injected(\.addReactionToFeeling)
    private var addReactionToFeeling: AddReactionToFeeling
    
    func addReaction(gifURL: URL?, emoji: String?, to feeling: FeelingEntity) {
        _ = addReactionToFeeling(gifURL: gifURL, emoji: emoji, to: feeling)
    }
    
}
