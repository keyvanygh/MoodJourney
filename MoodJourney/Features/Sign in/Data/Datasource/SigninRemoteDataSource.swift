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
        hasImage: Bool = false,
        name: String? = "",
        family: String? = "",
        givenName: String? = "",
        imageURL: String? = "") throws -> UserDataModel {
            let params:[String:Any] = [
                "userID":userID,
                "signedWith":thirdParty,
                "name":name,
                "family":family,
                "givenName":givenName,
                "imageURLString":imageURL
            ]
            let responseData =  try nm.post(path: "signin", body: params)
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
