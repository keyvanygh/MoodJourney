//
//  FetchUserIDFromKeychainUsecase.swift
//  MoodJourney
//
//  Created by Keyvan on 2/21/23.
//

import Foundation

class FetchUserIDFromKeychainUsecase{
    let repository: SigninRepository
    init(repository: SigninRepository) {
        self.repository = repository
    }
    func execute(){
        repository.fetchUserID()
    }
}
