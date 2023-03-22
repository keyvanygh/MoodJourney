//
//  FeelingRepositoryImpTest.swift
//  MoodJourneyTests
//
//  Created by sh on 3/22/23.
//

import XCTest
@testable import MoodJourney

final class FeelingRepositoryImpTest: XCTestCase {

    func test_reciveSuccess_whenFetchFeelingSuccess() throws {
        var mock = MockFeelingLocalDatasource()
        let feelings = try XCTUnwrap(FeelingEntity.someFeelings)
        let activty = try XCTUnwrap(ActivityEntity.someActivities.first)
        mock.answerWith(feelings)
        let sut = FeelingRepositoryImp(localDatasource: mock)
        let result = sut.fetchFeelings(of: activty)
        XCTAssert(result.isSuccess)
    }
    func test_reciveError_whenFetchFeelingFail() throws {
        var mock = MockFeelingLocalDatasource()
        let activty = try XCTUnwrap(ActivityEntity.someActivities.first)
        mock.answerWith(AnyError.error)
        let sut = FeelingRepositoryImp(localDatasource: mock)
        let result = sut.fetchFeelings(of: activty)
        XCTAssert(!result.isSuccess)
    }
}
