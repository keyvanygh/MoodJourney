//
//  ThirdPartySigninRemoteDataSource.swift
//  MoodJourney
//
//  Created by Keyvan on 2/16/23.
//

import Foundation

class SigninRemoteDataSource {
    private let nm: NetworkManager
    init(networkManager: NetworkManager) {
        self.nm = networkManager
    }
    func signin(
        withThirdParty thirdParty: String,
        userID: String,
        hasImage: Bool?,
        name: String?,
        family: String?,
        givenName: String?,
        imageURL: String?) throws -> UserDataModel {
            let responseData =  try nm.post()
            let responseModel =
            try JSONDecoder().decode(
                ServerResponse<UserDataModel>.self,
                from: responseData)
            return responseModel.data
        }
}

struct ServerResponse<T: Codable>: Codable {
    let data: T
    let status: String
}
