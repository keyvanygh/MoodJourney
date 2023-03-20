//
//  FetchHomeUsecase.swift
//  MoodJourney
//
//  Created by Keyvan on 2/22/23.
//

import Foundation

class FetchHome {
    let repository: HomeRepository
    init(repository: HomeRepository) {
        self.repository = repository
    }
    func callAsFunction(of user: UserEntity) -> Result<[FeelingEntity], Error> {
        return repository.fetchHome(of: user)
    }
}
