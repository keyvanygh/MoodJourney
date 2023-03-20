//
//  HomeLocalDatasource.swift
//  MoodJourneyTests
//
//  Created by sh on 3/19/23.
//

import XCTest
@testable import MoodJourney
final class HomeLocalDatasourceTest: XCTestCase {

    func test_getHome_whenFetchHomeSuccess() throws {
        let dbm = MockCoreDataManager()
        let sut = HomeLocalDatasource(dbm: dbm)
        let user = try XCTUnwrap(dbm.previewUser)
        _ = try sut.fetchHome(for: user)

    }
    
}
