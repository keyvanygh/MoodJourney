//
//  FeelingLocalDataSource.swift
//  MoodJourney
//
//  Created by Keyvan on 2/17/23.
//

import Foundation
import XCTest
@testable import MoodJourney

final class FeelingLocalDatasourceTest: XCTestCase {
    
    func test_reciveFeelings_whenFetchFeelingWithFeeling() throws {
        let sut : FeelingLocalDatasource = sut()
        let activityWithFeeling = try XCTUnwrap(ActivityEntity.activityWithFeeling)
        let feelings = try XCTUnwrap(sut.fetchFeelings(of: activityWithFeeling))
        XCTAssert(!feelings.isEmpty)
    }
    func test_reciveEmpty_whenFetchFeelingWithNoFeeling() throws {
        let sut : FeelingLocalDatasource = sut()
        let testActivty = try XCTUnwrap(ActivityEntity.activityWithNoFeeling)
        let feelings = try XCTUnwrap(sut.fetchFeelings(of: testActivty))
        XCTAssert(feelings.isEmpty)
    }
    
    func test_reciveOneFeeling_whenAddedFeelingToAnActivityWithNoFeeling() throws {
        let sut : FeelingLocalDatasource = sut()
        let activityWithNoFeeling = try XCTUnwrap(ActivityEntity.activityWithNoFeeling)
        _ = try XCTUnwrap(sut.addFeeling(
            feeling: Feeling.happy.rawValue,
            message: String.dontcare,
            imageURLString: String.dontcare,
            to: activityWithNoFeeling))
        XCTAssert(activityWithNoFeeling.feelings?.count == 1)
    }
    // MARK: Helpers:
    final private func sut() -> FeelingLocalDatasource {
        return FeelingLocalDatasource(dbm: MockCoreDataManager.shared, acm: AccountManager())
    }
}
