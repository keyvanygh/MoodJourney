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
                    with: SigninType.ThirdParty(thirdParty),
                    userID: userID,
                    name: name,
                    family: family,
                    imageURLString: imageURL?.absoluteString ?? "")
                guard let userID = user.userID else{throw(AnyError.error)}
                try lds.storeUserID(userID: userID)
                try lds.storeAccessToken(accessToken: userID)
                lds.setUserToACM(user: user)
                return .success(user)
            } catch {return .failure(AnyError.error)}
        }
    
    func fetchUser(byID id: String) -> Result<UserEntity, Error> {
        do{
            let user = try lds.fetchUser(byID: id)
            return .success(user)
        }catch{return .failure(AnyError.error)}
    }
    func fetchUserID() -> Result<String, Error> {
        do{
            return .success(try lds.fetchUserID())
        }catch{return .failure(AnyError.error)}
    }
}
