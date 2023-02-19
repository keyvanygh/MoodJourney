//
//  CheerleadersRepository.swift
//  MoodJourney
//
//  Created by Keyvan on 2/19/23.
//

import Foundation

protocol CheerleadersRepository {
    func fetchCheerleaders(userID: String) -> Result<[UserEntity],Error>
}
