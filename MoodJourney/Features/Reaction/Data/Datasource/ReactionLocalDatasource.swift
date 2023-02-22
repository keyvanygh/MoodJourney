//
//  ReactionLocalDatasource.swift
//  MoodJourney
//
//  Created by Keyvan on 2/22/23.
//

import Foundation
import Factory

class ReactionLocalDatasource {
    @Injected(Container.dbm) private var dbm: DatabaseManager
    
    func addReaction(_ reaction: ReactionEntity,to feeling: FeelingEntity){}
}
