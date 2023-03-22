//
//  MockCheerleadersLocalDatasource.swift
//  MoodJourneyTests
//
//  Created by Keyvan on 3/22/23.
//

import Foundation
@testable import MoodJourney

class MockCheerleadersLocalDatasource: AnyMock, CheerleadersLocalDatasource {
    var answer: Any?
    
    func fetchCheerleaders(of user: MoodJourney.UserEntity) throws -> [UserEntity] {
        return try answer([UserEntity].self)
    }
    
    func addCheerleader(cheerLeader: UserEntity, to user: UserEntity) {
        return

    }
}
