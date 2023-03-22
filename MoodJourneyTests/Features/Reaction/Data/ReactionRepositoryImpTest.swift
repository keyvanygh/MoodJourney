//
//  ReactionRepositoryImpTest.swift
//  MoodJourneyTests
//
//  Created by Keyvvan on 3/22/23.
//

import Foundation
import XCTest
@testable import MoodJourney

class ReactionRepositoryImpTest: XCTestCase {
    
    func test_success_whenAddReactionSuccess() throws {
        var mock = MockReactionLocalDatasource()
        let reaction = try XCTUnwrap(ReactionEntity.reaction)
        let feeling = try XCTUnwrap(FeelingEntity.someFeelings.first)
        mock.answerWith(reaction)
        let sut = ReactionRepositoryImp(lds: mock)
        let result = sut.addReaction(gifURL: URL(string: ""), emoji: "", to: feeling)
        XCTAssert(result.isSuccess)
    }
    func test_reciveError_whenAddReactionFail() throws {
        var mock = MockReactionLocalDatasource()
        let feeling = try XCTUnwrap(FeelingEntity.someFeelings.first)
        mock.answerWith(AnyError.error)
        let sut = ReactionRepositoryImp(lds: mock)
        let result = sut.addReaction(gifURL: URL(string: ""), emoji: "", to: feeling)
        XCTAssert(!result.isSuccess)
    }
}
