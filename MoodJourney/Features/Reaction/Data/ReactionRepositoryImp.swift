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
    func addReaction(_ reaction: ReactionEntity, to feeling: FeelingEntity) -> Result<ReactionEntity, Error> {
        do{
            try lds.addReaction(reaction, to: feeling)
        }catch{return .failure(AnyError.error)}
    }
    
    
}
