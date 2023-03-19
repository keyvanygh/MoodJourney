//
//  FetchFeelingsOfActivityTest.swift
//  MoodJourneyTests
//
//  Created by sh on 3/8/23.
//

import XCTest
@testable import MoodJourney

final class FetchFeelingsOfActivityTest: XCTestCase {

    func test_reciveFeelings_whenFetchFeelingOfActivitySucceed() throws {
        var mockedRepostiry = MockFeelingRepository()
        let answer:Result<[FeelingEntity], Error> = .success(FeelingEntity.someFeelings)
        mockedRepostiry.answerWith(answer)
        let sut : FetchFeelingsOfActivity = sut(repository: mockedRepostiry)
        let testActivty = try XCTUnwrap(ActivityEntity.testActivity)
        let result = sut(of: testActivty)
        XCTAssert(result.isSuccess)
        switch result {
        case .success(let feelings):
            XCTAssert(!feelings.isEmpty)
        case .failure:
            XCTFail("failed")
        }
    }
    func test_reciveError_whenAuthIsFailed() throws {
        var mockedRepostiry = MockFeelingRepository()
        let answer:Result<[FeelingEntity], Error> = .failure(AnyError.error)
        mockedRepostiry.answerWith(answer)
        let sut : FetchFeelingsOfActivity = sut(repository: mockedRepostiry)
        let testActivty = try XCTUnwrap(ActivityEntity.testActivity)
        let result = sut(of: testActivty)
        XCTAssert(!result.isSuccess)
    }
    
    // MARK: Helpers:
    final private func sut(repository : any FeelingRepository) -> FetchFeelingsOfActivity {
        return FetchFeelingsOfActivity(repository : repository)
    }

}
