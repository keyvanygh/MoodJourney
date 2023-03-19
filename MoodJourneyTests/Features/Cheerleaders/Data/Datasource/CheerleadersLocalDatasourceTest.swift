//
//  CheerleadersLocalDatasourceTest.swift
//  MoodJourneyTests
//
//  Created by Keyvan on 3/18/23.
//

import Foundation
import XCTest
@testable import MoodJourney

final class CheerleadersLocalDatasourceTest: XCTestCase {
    
    func test_reciveCheerleaders_whenFetchCheerleadersSucceed() throws {
        let dbm = MockCoreDataManager()
        let sut: CheerleadersLocalDatasource = sut(dbm: dbm)
        let user = try XCTUnwrap(UserEntity.testUser)
        let cheerleaders = try XCTUnwrap(sut.fetchCheerleaders(of: user))
        XCTAssert(cheerleaders.isEmpty)
    }
    
    func test_cheerleaderCountPlus1_whenAddCheerleadersSucceed() throws {
        let dbm = MockCoreDataManager()
        let sut: CheerleadersLocalDatasource = sut(dbm: dbm)
        let user = try XCTUnwrap(UserEntity.testUser)
        let user2 = try XCTUnwrap(UserEntity.testUser2)

        try XCTUnwrap(sut.addCheerleader(cheerLeader:user,to:user2))
        let cheerleaders = try XCTUnwrap(sut.fetchCheerleaders(of: user2))
        XCTAssert(!cheerleaders.isEmpty)

    }
    // MARK: - Helpers
    func sut(dbm: CoreDataManager) -> CheerleadersLocalDatasource {
        return CheerleadersLocalDatasource(dbm: dbm)
    }
}
