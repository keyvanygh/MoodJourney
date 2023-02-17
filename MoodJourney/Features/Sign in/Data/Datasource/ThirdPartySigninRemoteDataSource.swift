//
//  ThirdPartySigninRemoteDataSource.swift
//  MoodJourney
//
//  Created by sh on 2/16/23.
//

import Foundation

class ThirdPartySigninRemoteDataSource {
    let networkManager : INetworkManager
    init(networkManager: INetworkManager) {
        self.networkManager = networkManager
    }
    func signin(
        withThirdParty thirdParty: String,
        userID: String,
        hasImage: Bool?,
        name: String?,
        family: String?,
        givenName: String?,
        imageURL: String) throws -> UserDataModel  {
            _ =  try networkManager.post()
            return UserDataModel()
        }
    
}
