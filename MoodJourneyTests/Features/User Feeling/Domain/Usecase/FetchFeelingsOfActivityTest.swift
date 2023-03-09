//
//  FetchFeelingsOfActivityTest.swift
//  MoodJourneyTests
//
//  Created by sh on 3/8/23.
//

import XCTest
@testable import MoodJourney

final class FetchFeelingsOfActivityTest: XCTestCase {

    func test_reciveSuccessResponse_whenAddingFeelingToActivitySucceed() throws {
        let mockedRepostiry = MockFeelingRepository()
        mockedRepostiry.answerWith(Result<Bool, Error>.success(true))
        let sut : FetchFeelingsOfActivity = sut(repository: mockedRepostiry)
        let testActivty = try XCTUnwrap(ActivityEntity.testActivity)
        let result = sut(feeling: .happy, to: testActivty)
        XCTAssert(result.isSuccess)
    }
    func test_reciveError_whenAuthIsFailed() throws {
        let mockedRepostiry = MockFeelingRepository()
        mockedRepostiry.answerWith(Result<Bool, Error>.failure(AnyError.error))
        let sut : FetchFeelingsOfActivity = sut(repository: mockedRepostiry)
        let testActivty = try XCTUnwrap(ActivityEntity.testActivity)
        let result = sut(feeling: .happy, to: testActivty)
        XCTAssert(!result.isSuccess)
    }
    
    // MARK: Helpers:
    final private func sut(repository : any FeelingRepository) -> FetchFeelingsOfActivity {
        return FetchFeelingsOfActivity(repository : repository)
    }

}
