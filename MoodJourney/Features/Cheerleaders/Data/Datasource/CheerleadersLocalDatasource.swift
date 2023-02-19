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
        return cheerLeaders
    }
    func addCheerleader(cheerLeader: UserEntity, to user: UserEntity) {
        user.addToCheerleaders(cheerLeader)
        try? dbm.save()
    }
    func getUser(userID: String) throws -> UserEntity {
        guard let user = (try dbm.fetch(entity: .User) as? [UserEntity])?.first else {throw(AnyError.error)}
        return user
    }
    func addUser(userID: String) throws -> UserEntity {
        guard let user = dbm.add(entity: .User) as? UserEntity else {throw(AnyError.error)}
        user.userID = userID
        try? dbm.save()
        return user
    }
}
