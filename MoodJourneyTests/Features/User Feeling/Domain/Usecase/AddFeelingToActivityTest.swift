//
//  AddMoodUsecase.swift
//  MoodJourney
//
//  Created Keyvan sh on 2/16/23.
//

import XCTest
@testable import MoodJourney

final class AddFeelingToActivityTest: XCTestCase {

    func test_reciveSuccessResponse_whenAddingFeelingToActivitySucceed() throws {
        var mockedRepostiry = MockFeelingRepository()
        mockedRepostiry.answerWith(Result<Bool, Error>.success(true))
        let sut : AddFeelingToActivity = sut(repository: mockedRepostiry)
        let testActivty = try XCTUnwrap(ActivityEntity.testActivity)
        let result = sut(feeling: .happy, to: testActivty)
        XCTAssert(result.isSuccess)
    }
    func test_reciveError_whenAddingFeelingToActivityFailed() throws {
        var mockedRepostiry = MockFeelingRepository()
        mockedRepostiry.answerWith(Result<Bool, Error>.failure(AnyError.error))
        let sut : AddFeelingToActivity = sut(repository: mockedRepostiry)
        let testActivty = try XCTUnwrap(ActivityEntity.testActivity)
        let result = sut(feeling: .happy, to: testActivty)
        XCTAssert(!result.isSuccess)
    }
    
    // MARK: Helpers:
    final private func sut(repository : any FeelingRepository) -> AddFeelingToActivity {
        return AddFeelingToActivity(repository : repository)
    }
    
}
extension Result {
    var isSuccess: Bool {
        switch self {
        case .success:
            return true
        case .failure:
            return false
        }
    }
}
