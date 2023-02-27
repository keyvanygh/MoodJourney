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
                userID: String.dontcare)
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
                userID: String.dontcare)
            XCTFail("Failed")
            
        } catch {
            XCTAssert(true)
            
        }
    }
    func test_doseSendCurrectParamsToNetworkManager() {
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
            switch (mockedNetworkManager.calledFucntion) {
            case .post(let path, let params):
                XCTAssertEqual(path, SigninRemoteDataSource.Paths.signin.rawValue)
                XCTAssertEqual(params?[UserDataModel.CodingKeys.userID.stringValue] as? String,
                               UserDataModel.template.userID)
            default:
                XCTFail("failed")
            }
        } catch {
            XCTFail("failed")
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
            XCTAssertEqual(response.signedWith, UserDataModel.template.signedWith)
            XCTAssertEqual(response.name, UserDataModel.template.name)
            XCTAssertEqual(response.family, UserDataModel.template.family)
            XCTAssertEqual(
                response.imageURLString,
                UserDataModel.template.imageURLString)
            
        } catch {
            XCTFail("failed")
        }
    }
}
