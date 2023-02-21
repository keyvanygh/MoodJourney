//
//  CheerleadersRepository.swift
//  MoodJourney
//
//  Created by Keyvan on 2/19/23.
//

import Foundation

protocol CheerleadersRepository {
    /// fetch cheerers of user
    /// - Parameters:
    ///   - user: user
    /// - Returns:
    ///   - success: list of cheerers
    ///   - fail: CheerersError
    func fetchCheerleaders(of user: UserEntity) -> Result<[UserEntity],Error>
}
