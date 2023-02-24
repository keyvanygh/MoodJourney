//
//  FetchHomeUsecase.swift
//  MoodJourney
//
//  Created by Keyvan on 2/22/23.
//

import Foundation

class FetchHomeUsecase {
    let repository: HomeRepository
    init(repository: HomeRepository) {
        self.repository = repository
    }
    func execute(for user: UserEntity) -> Result<[FeelingEntity], Error> {
        return repository.fetchHome(for: user)
    }
}
