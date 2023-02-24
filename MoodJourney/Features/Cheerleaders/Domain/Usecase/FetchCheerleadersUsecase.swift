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
    /// execute usecase
    /// - Parameters:
    ///   - user: user
    /// - Returns:
    ///   - success: list of cheerers
    ///   - fail: CheerersError
    func execute(of user: UserEntity) -> Result<[UserEntity], Error> {
        return repository.fetchCheerleaders(of: user)
    }
}
