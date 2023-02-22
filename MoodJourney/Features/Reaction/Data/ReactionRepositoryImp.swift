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
    func addReaction(gifURL: URL?,emoji: String?,to feeling: FeelingEntity) -> Result<ReactionEntity, Error> {
        do{
            return .success(try lds.addReaction(gifURL: gifURL, emoji: "BOJO BOOJO", to: feeling))
        }catch{return .failure(AnyError.error)}
    }
    
    
}
