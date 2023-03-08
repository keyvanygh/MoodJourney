//
//  FetchUserIDFromKeychainUsecase.swift
//  MoodJourney
//
//  Created by Keyvan on 2/21/23.
//

import Foundation

class FetchUserIDFromKeychainUsecase {
    let repository: any SigninRepository
    init(repository: any SigninRepository) {
        self.repository = repository
    }
    func execute() -> Result<String, Error> {
        repository.fetchUserID()
    }
}
