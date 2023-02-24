//
//  UserTokenValidationUsecase.swift
//  MoodJourney
//
//  Created by Keyvan on 2/21/23.
//

import Foundation

class FetchUserByIDUsecase {
    let repository: SigninRepository
    init(repository: SigninRepository) {
        self.repository = repository
    }

    func execute(userID: String) -> Result<UserEntity, Error> {
        repository.fetchUser(byID: userID)
    }
}
