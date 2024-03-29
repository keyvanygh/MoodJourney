//
//  FetchCheerleadersUsecase.swift
//  MoodJourney
//
//  Created by Keyvan on 2/19/23.
//

import Foundation

class FetchCheerleaders {
    let repository: CheerleadersRepository
    init(repository: CheerleadersRepository) {
        self.repository = repository
    }
    /// execute usecase
    /// - Parameters:
    ///   - user: user
    /// - Returns:
    ///   - success: list of cheerers
    ///   - fail: CheerersError
    func callAsFunction(of user: UserEntity) -> Result<[UserEntity], Error> {
        return repository.fetchCheerleaders(of: user)
    }
}
