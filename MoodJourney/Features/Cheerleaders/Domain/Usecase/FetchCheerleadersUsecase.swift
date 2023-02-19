//
//  FetchCheerleadersUsecase.swift
//  MoodJourney
//
//  Created by Keyvan on 2/19/23.
//

import Foundation

class FetchCheerleadersUsecase {
    let repository: CheerleadersRepository
    init(repository: CheerleadersRepository) {
        self.repository = repository
    }
    func execute(userID: String) -> Result<[UserEntity],Error> {
        return repository.fetchCheerleaders(userID: userID)
    }
}
