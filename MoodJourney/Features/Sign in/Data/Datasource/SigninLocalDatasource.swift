//
//  SigninLocalDatasource.swift
//  MoodJourney
//
//  Created by Keyvan on 2/19/23.
//

import Foundation
import Factory

class SigninLocalDatasourceImp: SigninLocalDatasource {
    let dbm: CoreDataManager
    let kcm: KeychainManager
    var acm: AccountManager
    init(dbm: CoreDataManager, kcm: KeychainManager, acm: AccountManager) {
        self.dbm = dbm
        self.kcm = kcm
        self.acm = acm
    }
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

protocol SigninLocalDatasource {
    func signin(
        with signinType: SigninType,
        userID: String,
        name: String?,
        family: String?,
        imageURLString: String?
    ) throws -> UserEntity
    func fetchUser(byID userID: String) throws -> UserEntity
    func setUserToACM(user: UserEntity)
    func fetchUserAccessToken() throws -> String
    func storeAccessToken(accessToken: String) throws
    func storeUserID(userID: String) throws
    func fetchUserID() throws -> String
}
