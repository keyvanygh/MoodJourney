//
//  FetchUserIDFromKeychainUsecase.swift
//  MoodJourney
//
//  Created by Keyvan on 2/21/23.
//

import Foundation

class FetchUserIDFromKeychain {
    let repository: any SigninRepository
    init(repository: any SigninRepository) {
        self.repository = repository
    }
    func callAsFunction() -> Result<String, Error> {
        repository.fetchUserID()
    }
}
