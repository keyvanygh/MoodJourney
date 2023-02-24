//
//  ThirdPartySigninRemoteDataSource.swift
//  MoodJourney
//
//  Created by Keyvan on 2/16/23.
//

import Foundation

class SigninRemoteDataSource {
    private let nm: INetworkManager
    init(networkManager: INetworkManager) {
        self.nm = networkManager
    }
    func signin(
        withThirdParty thirdParty: String,
        userID: String,
        hasImage: Bool?,
        name: String?,
        family: String?,
        givenName: String?,
        imageURL: String) throws -> UserDataModel {
            _ =  try nm.post()
            return UserDataModel()
        }
}
