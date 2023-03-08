//
//  UserTokenValidationUsecase.swift
//  MoodJourney
//
//  Created by Keyvan on 2/21/23.
//

import Foundation

class FetchUserByIDUsecase {
    let repository: any SigninRepository
    init(repository: any SigninRepository) {
        self.repository = repository
    }

    func execute(userID: String) -> Result<UserEntity, Error> {
        repository.fetchUser(byID: userID)
    }
}
