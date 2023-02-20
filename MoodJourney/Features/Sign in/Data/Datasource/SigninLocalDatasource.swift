//
//  SigninLocalDatasource.swift
//  MoodJourney
//
//  Created by Keyvan on 2/19/23.
//

import Foundation
import Factory

class SigninLocalDatasource {
    @Injected(Container.dbm) var dbm: LocalDatabaseManager
    
    func signin(
        userID: String,
        name: String? = "",
        lastName: String? = "",
        imageURLString: String? = "") throws -> UserEntity {
            if let exsitingUser = (try dbm.fetch(entity: .User) as? [UserEntity])?.first(where: {$0.userID == userID}) {
                return exsitingUser
            }
            guard let user = dbm.add(entity: .User) as? UserEntity else{throw(AnyError.error)}
            user.userID = userID
            user.name = name
            user.familyName = lastName
            user.imageURLString = imageURLString
            try? dbm.save()
            return user
    }
    
}
