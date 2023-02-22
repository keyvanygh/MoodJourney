//
//  ReactionRepositoryImp.swift
//  MoodJourney
//
//  Created by Keyvan on 2/22/23.
//

import Foundation

class ReactionRepositoryImp: ReactionRepository {
    private let lds: ReactionLocalDatasource
    init(lds: ReactionLocalDatasource){
        self.lds = lds
    }
    func addReaction(_ reaction: ReactionEntity, to feeling: Feeling) -> Result<ReactionEntity, Error> {
        
    }
    
    
}
