//
//  ActivityLocalDatasourceTest.swift
//  MoodJourneyTests
//
//  Created by Keyvan on 3/9/23.
//

import Foundation
import XCTest
@testable import MoodJourney

final class ActivityLocalDatasourceTest: XCTestCase {
    
    func test_reciveActivities_WhenFetchActivitiesSucceed() throws {
        let mockCoreDataManager = MockCoreDataManager()
        mockCoreDataManager.addSomeActivities()
        let sut: ActivityLocalDatasource = ActivityLocalDatasource(dbm: mockCoreDataManager)
        let result = try XCTUnwrap(sut.fetchActivies())
        XCTAssert(!result.isEmpty)
    }
    func test_reciveEmpty_WhenThereIsNoActivityToFetch() throws {
        let mockCoreDataManager = MockCoreDataManager()
        let sut: ActivityLocalDatasource = ActivityLocalDatasource(dbm: mockCoreDataManager)
        let result = try XCTUnwrap(sut.fetchActivies())
        XCTAssert(result.isEmpty)
    }
}
