//
//  Repository.swift
//  MoodJourney
//
//  Created by Keyvan on 2/16/23.
//

import Foundation

class SigninRepository : ISigninRepository {
    let rds : SigninRemoteDataSource
    let lds : SigninLocalDatasource
    
    init(rds: SigninRemoteDataSource, lds: SigninLocalDatasource) {
        self.rds = rds
        self.lds = lds
    }
    
    func signin(
        withThirdParty thirdParty: ThirdParty,
        userID: String, hasImage: Bool?,
        name: String?, family: String?,
        givenName: String?,
        imageURL: URL?) -> Result<UserEntity, Error> {
            do{
                let user = try lds.signin(
                    userID: userID,
                    name: name,
                    lastName: "",
                    imageURLString: imageURL?.absoluteString ?? "")
                return .success(user)
            }catch{return .failure(AnyError.error)}
        }
}
