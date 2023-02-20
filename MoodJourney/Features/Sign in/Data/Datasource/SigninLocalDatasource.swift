//
//  SigninLocalDatasource.swift
//  MoodJourney
//
//  Created by Keyvan on 2/19/23.
//

import Foundation
import Factory

class SigninLocalDatasource {
    /// singelton database manager
    @Injected(Container.dbm) var dbm: LocalDatabaseManager
    
    /// Signin
    /// - Parameters:
    ///   - with: signinType rawValue e.g: PhoneNumber, Apple
    ///   - userID: userID provided by 3'rd party
    ///   - name: name provided by 3'rd party
    ///   - hasImage if user has an image or not
    ///   - family: last name provided by 3'rd party
    ///   - imageURLString: user image url absoluteString
    /// - Returns:
    ///   - if user exsit, return existing user
    ///   - if user dose not exist create user and return it
    /// - Throws:
    ///   - throw SigninError
    func signin(
        with signinType: String,
        userID: String,
        name: String? = "",
        family: String? = "",
        imageURLString: String? = "") throws -> UserEntity {
            if let exsitingUser = fetchUser(with: userID) {return exsitingUser}
            guard let user = dbm.add(entity: .User) as? UserEntity else{throw(AnyError.error)}
            user.userID = userID
            user.name = name
            user.familyName = family
            user.imageURLString = imageURLString
            user.signedWith = signinType
            try? dbm.save()
            return user
        }
    
    func fetchUser(with userID: String) -> UserEntity? {
        return try? (dbm.fetch(entity: .User) as? [UserEntity])?
            .first(where: {$0.userID == userID})
    }
    
}
