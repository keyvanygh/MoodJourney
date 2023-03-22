//
//  ActivityRepositoryImpTest.swift
//  MoodJourneyTests
//
//  Created by Keyvan on 3/22/23.
//

import Foundation
import XCTest
@testable import MoodJourney

class ActivityRepositoryImpTest: XCTestCase {
    func test_getActivityData_whenActivityRepositorySuccess() throws {
        var mock = MockActivityLocalDatasource()
        let someActivities = try XCTUnwrap(ActivityEntity.someActivities)
        mock.answerWith(someActivities)
        let sut = ActivityRepositoryImp(lds: mock)
        _ = try XCTUnwrap(UserEntity.testUser)
        let result = sut.fetchActivities()
        XCTAssert(result.isSuccess)
    }
    func test_getError_whenActivityRepositoryFail() throws {
        var mock = MockActivityLocalDatasource()
        mock.answerWith(AnyError.error)
        let sut = ActivityRepositoryImp(lds: mock)
        _ = try XCTUnwrap(UserEntity.testUser)
        let result = sut.fetchActivities()
        XCTAssert(!result.isSuccess)
    }
//    func test_activityAdded_whenAddActivitySuccess() throws {
//        var mock = MockActivityLocalDatasource()
//        let someActivities = try XCTUnwrap(ActivityEntity.someActivities)
//        mock.answerWith(someActivities)
//        let sut = ActivityRepositoryImp(lds: mock)
//        let user = try XCTUnwrap(UserEntity.testUser)
//        XCTAssert(result.isSuccess)
//    }
    
}
class MockActivityLocalDatasource: AnyMock, ActivityLocalDatasource {
    var answer: Any?
    
    func addActivity(activityID: String, name: String, imageURLString: String?) throws -> ActivityEntity {
        return try answer(ActivityEntity.self)
    }
    
    func fetchActivies() throws -> [ActivityEntity] {
        return try answer([ActivityEntity].self)
    }
}
