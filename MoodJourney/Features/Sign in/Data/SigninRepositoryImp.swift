//
//  Repository.swift
//  MoodJourney
//
//  Created by Keyvan on 2/16/23.
//

import Foundation

class SigninRepositoryImp : SigninRepository {
    
    /// remote data source
    fileprivate let rds : SigninRemoteDataSource
    /// local data source
    fileprivate let lds : SigninLocalDatasource
    
    init(rds: SigninRemoteDataSource, lds: SigninLocalDatasource) {
        self.rds = rds
        self.lds = lds
    }
    
    /// Signin using  **3'rd Party**
    /// - Parameters:
    ///   - thirdParty: 3'rd party type e.g: .Google
    ///   - userID: userID provided by 3'rd party
    ///   - name: name provided by 3'rd party
    ///   - hasImage if user has an image or not
    ///   - family: last name provided by 3'rd party
    ///   - givenName: given name provided by 3'rd party
    ///   - imageURL: user image url
    /// - Returns:
    ///   - success: UserEntity
    ///   - fail: SigninError
    func signin(
        withThirdParty thirdParty: ThirdParty,
        userID: String, hasImage: Bool?,
        name: String?, family: String?,
        givenName: String?,
        imageURL: URL?) -> Result<UserEntity, Error> {
            do{
                let user = try lds.signin(
                    with: thirdParty.rawValue,
                    userID: userID,
                    name: name,
                    family: family,
                    imageURLString: imageURL?.absoluteString ?? "")
                return .success(user)
            }catch{return .failure(AnyError.error)}
        }
}
