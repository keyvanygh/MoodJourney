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
    @Injected(\.dbm) var dbm: CoreDataManager
    @Injected(\.kcm) var kcm: KeychainManager
    @Injected(\.acm) var acm: AccountManager
    let userDefualts = UserDefaults.standard

    /// Local Datasource Signin:
    /// - Parameters:
    ///   - with: signinType e.g: PhoneNumber, Apple
    ///   - userID: userID provided by 3'rd party
    ///   - name: name provided by 3'rd party
    ///   - hasImage if user has an image or not
    ///   - family: last name provided by 3'rd party
    ///   - imageURLString: user image url absoluteString
    /// - Returns:
    ///   - if user exsit, return existing user
    ///   - if user dose not exist, create user and return it
    /// - Throws:
    ///   - throw SigninError
    func signin(
        with signinType: SigninType,
        userID: String,
        name: String? = "",
        family: String? = "",
        imageURLString: String? = "") throws -> UserEntity {
            if let exsitingUser = try? fetchUser(byID: userID) {return exsitingUser}
            guard let user = dbm.add(entity: .user) as? UserEntity else {throw(AnyError.error)}
            user.userID = userID
            user.name = name
            user.familyName = family
            user.imageURLString = imageURLString
            user.signedWith = signinType.rawValue
            try? dbm.save()
            return user
        }

    func fetchUser(byID userID: String) throws -> UserEntity {
        guard let user =  try (dbm.fetch(entity: .user) as? [UserEntity])?
            .first(where: {$0.userID == userID}) else {throw(AnyError.error)}
        return user
    }
    func storeUserID(userID: String) throws {
        guard let data = userID.data(using: .utf8) else {return}
        try kcm.save(data: data, to: .userID)
    }
    func storeAccessToken(accessToken: String) throws {
        guard let data = accessToken.data(using: .utf8) else {return}
        try kcm.save(data: data, to: .accessToken)
    }
    func fetchUserID() throws -> String {
        try kcm.read(.userID)
    }
    func fetchUserAccessToken() throws -> String {
        try kcm.read(.accessToken)
    }
    func setUserToACM(user: UserEntity) {
        acm.user = user
    }
}
