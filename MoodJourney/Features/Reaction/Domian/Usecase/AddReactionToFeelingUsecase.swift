//
//  AddReactionToFeeling.swift
//  MoodJourney
//
//  Created by Keyvan on 2/22/23.
//

import Foundation

class AddReactionToFeelingUsecase {
    let repository: ReactionRepository
    init(repository: ReactionRepository) {
        self.repository = repository
    }
    func execute(){}
}
