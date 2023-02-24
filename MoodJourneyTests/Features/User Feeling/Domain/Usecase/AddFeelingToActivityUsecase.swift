//
//  AddMoodUsecase.swift
//  MoodJourney
//
//  Created Keyvan sh on 2/16/23.
//

import XCTest
@testable import MoodJourney

final class AddFeelingToActivityUsecaseTest: XCTestCase {
    
//    func test_reciveSuccessResponse_whenAddingFeelingToActivitySucceed() {
//        let mockedRepostiry = MockedRepository(isSuccess: true)
//        let sut : AddFeelingToActivityUsecase = sut(repository: mockedRepostiry)
//        let result = sut.execute(activityID: "activityID", feeling: .Happy, message: "", to: <#ActivityEntity#>)
//        XCTAssert(result.isSuccess)
//    }
//    func test_reciveError_whenAuthIsFailed() {
//        let mockedRepostiry = MockedRepository(isSuccess: false)
//        let sut : AddFeelingToActivityUsecase = sut(repository: mockedRepostiry)
//        let result = sut.execute(activityID: "activityID", feeling: .Happy, message: "")
//        print(result.isSuccess)
//        XCTAssert(!result.isSuccess)
//    }
    
    // MARK: Helpers:
//    final private func sut(repository : FeelingRepository) -> AddFeelingToActivityUsecase {
//        return AddFeelingToActivityUsecase(repository : repository)
//    }
//    
//    class MockedRepository : FeelingRepository {
//        let isSuccess : Bool
//        let successResponse = UserEntity(hasImage: true, userID: "ID")
//        
//        init(isSuccess: Bool) {
//            self.isSuccess = isSuccess
//        }
//        func addFeeling(activityID activity: String, feeling: MoodJourney.FeelingEntity) -> Result<Bool,Error> {
//            if isSuccess {return .success(true)}else{return.failure(AnyError.error)}
//        }
//    }
}
extension Result{
    var isSuccess: Bool {
        switch(self){
        case .success(_):
            return true
        case .failure(_):
            return false
        }
    }
}
