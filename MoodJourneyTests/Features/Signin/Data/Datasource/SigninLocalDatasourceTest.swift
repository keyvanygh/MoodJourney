//
//  SigninLocalDatasourceTest.swift
//  MoodJourneyTests
//
//  Created by Keyvan on 3/22/23.
//

import XCTest
@testable import MoodJourney

final class SigninLocalDatasourceTest: XCTestCase {
    
    func test_reciveUser_whenSigninSuccess() throws {
        let mockCoreData = MockCoreDataManager()
        let kcm = KeychainManager()
        let acm = AccountManager()
        let sut : SigninLocalDatasourceImp = sut(dbm: mockCoreData, kcm: kcm, acm: acm)
        _ = try XCTUnwrap(sut.signin(with: .thirdParty(.google), userID: "ID"))
    }
//    func test_reciveError_test_whenSigninFail() throws {
//        let mockCoreData = MockCoreDataManager()
//        let kcm = KeychainManager()
//        let acm = AccountManager()
//        let sut : SigninLocalDatasourceImp = sut(dbm: mockCoreData, kcm: kcm, acm: acm)
//        try sut.signin(with: .thirdParty(.google), userID: "ID")
//        XCTAssert(feelings.isEmpty)
//    }
//
//    func test_reciveOneFeeling_whenAddedFeelingToAnActivityWithNoFeeling() throws {
//        let sut : FeelingLocalDatasource = sut()
//        let activityWithNoFeeling = try XCTUnwrap(ActivityEntity.activityWithNoFeeling)
//        _ = try XCTUnwrap(sut.addFeeling(
//            feeling: Feeling.happy.rawValue,
//            message: String.dontcare,
//            imageURLString: String.dontcare,
//            to: activityWithNoFeeling))
//        XCTAssert(activityWithNoFeeling.feelings?.count == 1)
//    }
//
    // MARK: Helpers:
    final private func sut(
        dbm: CoreDataManager,
        kcm: KeychainManager,
        acm: AccountManager
    ) -> SigninLocalDatasourceImp {
        return SigninLocalDatasourceImp(dbm: dbm, kcm: kcm, acm: acm)
    }
    
}
