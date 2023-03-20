//
//  ReactionLocalDatasourceTest.swift
//  MoodJourneyTests
//
//  Created by Keyvan on 3/19/23.
//

import XCTest
@testable import MoodJourney

final class ReactionLocalDatasourceTest: XCTestCase {
    
    func test() throws {
        let dbm = MockCoreDataManager()
        let sut = ReactionLocalDatasource(dbm: dbm)
        let feeling = try XCTUnwrap(dbm.someFeelings.first)
        _ = try XCTUnwrap(
            sut.addReaction(
                gifURL: URL(string: "URL"),
                emoji: "Emoji",
                to: feeling
            )
        )
        let reactions = try XCTUnwrap(feeling.reactions)
        XCTAssert((reactions.count == 1))
    }
}
