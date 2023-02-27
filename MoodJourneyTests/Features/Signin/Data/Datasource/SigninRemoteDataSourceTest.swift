//
//  ThirdPartySigninDataSource.swift
//  MoodJourneyTests
//
//  Created by Keyvan on 2/16/23.
//

import XCTest
@testable import MoodJourney

final class SigninRemoteDataSourceTest: XCTestCase {
    
    func test_doNotThrow_whenSinginSucceed() {
        let mockedNetworkManager = MockNetworkManager(
            response:.signinSuccess,
            willSucceed: true)
        let sut = SigninRemoteDataSource(networkManager: mockedNetworkManager)
        do {
            _ = try sut.signin(
                withThirdParty: String.dontcare,
                userID: String.dontcare,
                hasImage: Bool.dontcare,
                name: String.dontcare,
                family: String.dontcare,
                givenName: String.dontcare,
                imageURL: String.dontcare)
            XCTAssert(true)
            
        } catch {
            XCTFail("failed")
        }
    }
    func test_throwsError_whenSinginFailed() {
        let mockedNetworkManager = MockNetworkManager(
            response:.signinFailed,
            willSucceed: false)
        let sut = SigninRemoteDataSource(networkManager: mockedNetworkManager)
        do {
            _ = try sut.signin(
                withThirdParty: String.dontcare,
                userID: String.dontcare,
                hasImage: Bool.dontcare,
                name: String.dontcare,
                family: String.dontcare,
                givenName: String.dontcare,
                imageURL: String.dontcare)
            XCTFail("Failed")
            
        } catch {
            XCTAssert(true)
            
        }
    }
    func test_reciveCurrectUserDataModel_whenSigninSucceed() {
        let mockedNetworkManager = MockNetworkManager(
            response:.signinSuccess,
            willSucceed: true)
        let sut = SigninRemoteDataSource(networkManager: mockedNetworkManager)
        do {
            let response = try sut.signin(
                withThirdParty: UserDataModel.template.signedWith,
                userID: UserDataModel.template.userID,
                hasImage:  Bool.dontcare,
                name:  UserDataModel.template.name,
                family:  UserDataModel.template.family,
                givenName:  UserDataModel.template.family,
                imageURL:  UserDataModel.template.imageURLString)
            XCTAssertEqual(response.userID, UserDataModel.template.userID)
        } catch {
            XCTFail("failed")
        }
    }
}
