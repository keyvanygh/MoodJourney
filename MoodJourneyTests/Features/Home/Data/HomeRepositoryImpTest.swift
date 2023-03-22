//
//  HomeRepositoryImpTest.swift
//  MoodJourneyTests
//
//  Created by Keyvan on 3/22/23.
//

import XCTest
@testable import MoodJourney

final class HomeRepositoryImpTest: XCTestCase {
    
    func test_getHomeData_whenFetchHomeRepositorySuccess() throws {
        var mock = MockHomeLocalDatasource()
        let feelings = try XCTUnwrap(FeelingEntity.someFeelings)
        mock.answerWith(feelings)
        let sut = HomeRepositoryImp(lds: mock)
        let user = try XCTUnwrap(UserEntity.testUser)
        let result = sut.fetchHome(of: user)
        XCTAssert(result.isSuccess)
    }
    func test_getError_whenFetchHomeRepositoryFailed() throws {
        var mock = MockHomeLocalDatasource()
        mock.answerWith(AnyError.error)
        let sut = HomeRepositoryImp(lds: mock)
        let user = try XCTUnwrap(UserEntity.testUser)
        let result = sut.fetchHome(of: user)
        XCTAssert(!result.isSuccess)
    }
}
class MockHomeLocalDatasource: HomeLocalDatasource, AnyMock {
    func fetchHome(for user: UserEntity) throws -> [FeelingEntity] {
        return try answer([FeelingEntity].self)
    }
    var answer: Any?
}
