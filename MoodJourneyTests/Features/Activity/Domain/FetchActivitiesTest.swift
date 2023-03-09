//
//  FetchActivitiesTest.swift
//  MoodJourneyTests
//
//  Created by Keyvan on 3/8/23.
//

import XCTest
@testable import MoodJourney

final class FetchActivitiesTest: XCTestCase {
    
    func test_reciveActivities_WhenFetchActivitiesSucceed() {
        let mockRepository = MockActivityRepository()
        mockRepository.answerWith(ActivityEntity.someActivities)
        let sut: FetchActivities = FetchActivities(repository: mockRepository)
        let result = sut()
        switch result {
        case .success(let activities):
            XCTAssert(!activities.isEmpty)
        case .failure:
            XCTFail("Failed")
        }
    }
    func test_reciveEmpty_WhenThereIsNoActivityToFetch() {
        let mockRepository = MockActivityRepository()
        mockRepository.answerWith([])
        let sut: FetchActivities = FetchActivities(repository: mockRepository)
        let result = sut()
        switch result {
        case .success(let activities):
            XCTAssert(activities.isEmpty)
        case .failure:
            XCTFail("Failed")
        }
    }
}
