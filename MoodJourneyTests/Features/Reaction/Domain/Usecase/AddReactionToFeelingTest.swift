//
//  AddReactionToFeelingTest.swift
//  MoodJourneyTests
//
//  Created by Keyvan on 3/19/23.
//

import XCTest
@testable import MoodJourney

final class AddReactionToFeelingTest: XCTestCase {

    func test_reciveTrue_WhenAddReactionToFeelingSucsseed() throws {
        var mockRepository = MockReactionRepository()
        let reaction = try XCTUnwrap(ReactionEntity.reaction)
        mockRepository.answerWith(reaction)
        let sut = AddReactionToFeeling(repository: mockRepository)
        let feeling = try XCTUnwrap(FeelingEntity.someFeelings.first)
        let result = sut(gifURL: URL(string: "URL"), emoji: "DontCare", to: feeling)
        switch result {
        case .success: XCTAssert(true)
        case .failure: XCTFail("Failed")
        }
    }
}
