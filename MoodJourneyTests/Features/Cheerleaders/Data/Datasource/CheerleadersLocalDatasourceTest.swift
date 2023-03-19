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
        var dbm = MockCoreDataManager()
        let sut: CheerleadersLocalDatasource = sut(dbm: dbm)
        let user = try XCTUnwrap(UserEntity.testUser)
        let result = try XCTUnwrap(sut.fetchCheerleaders(of: user))
    }
    
    // MARK: - Helpers
    func sut(dbm: CoreDataManager) -> CheerleadersLocalDatasource {
        return CheerleadersLocalDatasource(dbm: dbm)
    }
}
