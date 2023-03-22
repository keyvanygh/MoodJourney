//
//  SigninLocalDatasourceTest.swift
//  MoodJourneyTests
//
//  Created by Keyvan on 3/22/23.
//

import XCTest
@testable import MoodJourney

final class SigninLocalDatasourceTest: XCTestCase {
    
    func test_reciveUser_whenSigninSuccess() throws {
        let mockCoreData = MockCoreDataManager()
        let kcm = MockKeychainManager()
        let acm = AccountManager()
        let sut : SigninLocalDatasourceImp = sut(dbm: mockCoreData, kcm: kcm, acm: acm)
        _ = try XCTUnwrap(sut.signin(with: .thirdParty(.google), userID: "ID"))
    }
    func test_reciveAccessToken_whenFetchUserAccessTokenuccess() throws {
        let mockCoreData = MockCoreDataManager()
        var kcm = MockKeychainManager()
        let acm = AccountManager()
        kcm.answerWith("accessToken")
        let sut : SigninLocalDatasourceImp = sut(dbm: mockCoreData, kcm: kcm, acm: acm)
        let accessToken = try sut.fetchUserAccessToken()
        XCTAssert(!accessToken.isEmpty)
    }
    func test_reciveUserID_whenFetchUserSuccess() throws {
        let mockCoreData = MockCoreDataManager()
        var kcm = MockKeychainManager()
        kcm.answerWith("ID")
        let acm = AccountManager()
        let sut : SigninLocalDatasourceImp = sut(dbm: mockCoreData, kcm: kcm, acm: acm)
        let userID = try sut.fetchUserID()
        XCTAssert(!userID.isEmpty)
    }
    func test_dontThrowError_whenStoreUserIDSuccess() throws {
        let mockCoreData = MockCoreDataManager()
        let kcm = MockKeychainManager()
        let acm = AccountManager()
        let sut : SigninLocalDatasourceImp = sut(dbm: mockCoreData, kcm: kcm, acm: acm)
        _ =  try sut.storeUserID(userID: "ID")
    }
    func test_dontThrowError_whenStoreAccessTokenSuccess() throws {
        let mockCoreData = MockCoreDataManager()
        let kcm = MockKeychainManager()
        let acm = AccountManager()
        let sut : SigninLocalDatasourceImp = sut(dbm: mockCoreData, kcm: kcm, acm: acm)
        _ =  try sut.storeAccessToken(accessToken: "Token")
    }
    func test_dontThrowError_whenSetUserToACMSuccess() throws {
        let mockCoreData = MockCoreDataManager()
        let kcm = MockKeychainManager()
        let acm = AccountManager()
        let sut : SigninLocalDatasourceImp = sut(dbm: mockCoreData, kcm: kcm, acm: acm)
        let user = try XCTUnwrap(UserEntity.testUser)
        sut.setUserToACM(user: user)
    }
    // MARK: Helpers:
    final private func sut(
        dbm: CoreDataManager,
        kcm: KeychainManager,
        acm: AccountManager
    ) -> SigninLocalDatasourceImp {
        return SigninLocalDatasourceImp(dbm: dbm, kcm: kcm, acm: acm)
    }
}

class MockKeychainManager: KeychainManager,AnyMock {
    func read(_ service: MoodJourney.Service) throws -> String {
        return try answer(String.self)
    }
    
    func save(data: Data, to service: MoodJourney.Service) throws {}
    
    func delete(_ service: MoodJourney.Service) throws {}
    
    var answer: Any?
}
