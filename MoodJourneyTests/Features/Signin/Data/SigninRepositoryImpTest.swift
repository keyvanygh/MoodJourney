//
//  SigninRepositoryImpTest.swift
//  MoodJourneyTests
//
//  Created by Keyvan on 3/22/23.
//

import XCTest
@testable import MoodJourney

final class SigninRepositoryImpTest: XCTestCase {

    func test_reciveUser_whenSigninSuccess() throws {
        var lds = MockSigninLocalDatasource()
        let rds = SigninRemoteDataSource(networkManager: MockNetworkManager(willSucceed: true))
        let user = try XCTUnwrap(UserEntity.testUser)
        lds.answerWith(user)
        let sut = SigninRepositoryImp(rds: rds, lds: lds)
        let result = sut.signin(
            withThirdParty: .google,
            userID: "id",
            hasImage: true,
            name: "",
            family: "",
            givenName: "",
            imageURL: nil)
        XCTAssert(result.isSuccess)
    }
    func test_reciveUserID_whenFetchUserIDSuccess() throws {
        var lds = MockSigninLocalDatasource()
        let rds = SigninRemoteDataSource(networkManager: MockNetworkManager(willSucceed: true))
        lds.answerWith("userID")
        let sut = SigninRepositoryImp(rds: rds, lds: lds)
        let result = sut.fetchUserID()
        XCTAssert(result.isSuccess)
    }
    func test_reciveUser_whenfetchUserByIDSuccess() throws {
        var lds = MockSigninLocalDatasource()
        let rds = SigninRemoteDataSource(networkManager: MockNetworkManager(willSucceed: true))
        let user = try XCTUnwrap(UserEntity.testUser)
        lds.answerWith(user)
        let sut = SigninRepositoryImp(rds: rds, lds: lds)
        let result = sut.fetchUser(byID: "ID")
        XCTAssert(result.isSuccess)
    }
    func test_reciveError_whenSigninFail() throws {
        var lds = MockSigninLocalDatasource()
        let rds = SigninRemoteDataSource(networkManager: MockNetworkManager(willSucceed: true))
        lds.answerWith(AnyError.error)
        let sut = SigninRepositoryImp(rds: rds, lds: lds)
        let result = sut.signin(
            withThirdParty: .google,
            userID: "id",
            hasImage: true,
            name: "",
            family: "",
            givenName: "",
            imageURL: nil)
        XCTAssert(!result.isSuccess)
    }
    
}

class MockSigninLocalDatasource: SigninLocalDatasource, AnyMock {
    func signin(
        with signinType: SigninType,
        userID: String,
        name: String?,
        family: String?,
        imageURLString: String?
    ) throws -> UserEntity {
        return try answer(UserEntity.self)
    }
    
    func fetchUser(byID userID: String) throws -> UserEntity {
        return try answer(UserEntity.self)
    }
    
    func setUserToACM(user: UserEntity) {}
    
    func fetchUserAccessToken() throws -> String {
        return try answer(String.self)
    }
    
    func storeAccessToken(accessToken: String) throws {}
    
    func storeUserID(userID: String) throws {}
    
    func fetchUserID() throws -> String {
        return try answer(String.self)
    }
    
    var answer: Any?

}
class MockSigninRemoteDataSource: SigninRemoteDataSource, AnyMock {
    var answer: Any?
    
}
