//
//  CheerleadersLocalDatasource.swift
//  MoodJourney
//
//  Created by Keyvan on 2/19/23.
//

import Foundation
import Factory

class CheerleadersLocalDatasource {
    @LazyInjected(Container.dbm) private var dbm
    
    func fetchCheerleaders(of user: UserEntity) throws -> [UserEntity] {
        guard let cheerLeaders = user.cheerleaders?.array as? [UserEntity] else {throw(AnyError.error)}
//        guard let cheerleaders = try dbm.fetch(entity: .User) as? [UserEntity] else {throw(AnyError.error)}
        return cheerLeaders
    }
    func addCheerleader(cheerLeader: UserEntity, to user: UserEntity) {
        user.addToCheerleaders(cheerLeader)
        try? dbm.save()
    }
}
