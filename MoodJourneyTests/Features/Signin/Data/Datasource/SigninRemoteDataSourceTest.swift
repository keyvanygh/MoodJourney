//
//  ThirdPartySigninDataSource.swift
//  MoodJourneyTests
//
//  Created by Keyvan on 2/16/23.
//

import XCTest
@testable import MoodJourney

final class SigninRemoteDataSourceTest: XCTestCase {

    func test_reciveUserDataModel_whenSinginSucceed() {
        let mockedNetworkManager = MockedNetworkManager(willSucceed: true)
        let sut = SigninRemoteDataSource(networkManager: mockedNetworkManager)
        do {
            _ = try sut.signin(
            withThirdParty: ".Google",
            userID: "String",
            hasImage: false,
            name: "String",
            family: "String?",
            givenName: " String",
            imageURL: "String")
            XCTAssert(true)

        } catch {
            XCTFail("failed")

        }
    }
    func test_throwsError_whenSinginFailed() {
        let mockedNetworkManager = MockedNetworkManager(willSucceed: false)
        let sut = SigninRemoteDataSource(networkManager: mockedNetworkManager)
        do {
            _ = try sut.signin(
            withThirdParty: ".Google",
            userID: "String",
            hasImage: false,
            name: "String",
            family: "String?",
            givenName: " String",
            imageURL: "String")
            XCTFail("Failed")

        } catch {
            XCTAssert(true)

        }
    }
}

class MockedNetworkManager: NetworkManager {
    let willSucceed: Bool
    let successResponseJson: String = ""
    let errorResponseJson: String = ""
    
    init(willSucceed: Bool) {
        self.willSucceed = willSucceed
    }

    func get() throws -> Data {
        if willSucceed {return Data()} else {throw(AnyError.error)}
    }
    func post() throws -> Data {
        if willSucceed {return Data()} else {throw(AnyError.error)}
    }
    func path() throws -> Data {
        if willSucceed {return Data()} else {throw(AnyError.error)}
    }
    func delete() throws -> Data {
        if willSucceed {return Data()} else {throw(AnyError.error)}
    }

}
