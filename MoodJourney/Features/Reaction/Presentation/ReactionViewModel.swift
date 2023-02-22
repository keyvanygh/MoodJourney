//
//  ReactionView.swift
//  MoodJourney
//
//  Created by Keyvan on 2/22/23.
//

import Foundation
import Factory

class ReactionViewModel: ObservableObject {
    @Injected(Container.addReactionToFeelingUsecase) private var addReactionToFeelingUsecase
    
    
    func addReaction(gifURL: URL?,emoji: String?,to feeling: FeelingEntity){
        
    }
    
}
