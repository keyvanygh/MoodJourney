//
//  MockCheerleadersRepository.swift
//  MoodJourneyTests
//
//  Created by Keyvan on 3/18/23.
//

import Foundation
@testable import MoodJourney

class MockCheerleadersRepository: CheerleadersRepository, AnyMock {
    
    func fetchCheerleaders(of user: MoodJourney.UserEntity) -> Result<[MoodJourney.UserEntity], Error> {
        answer(Result<[MoodJourney.UserEntity], Error>.self)
    }
    
    var answer: Any?
    
    
}
