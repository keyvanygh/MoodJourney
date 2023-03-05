//
//  SplashView.swift
//  MoodJourney
//
//  Created by Keyvan on 2/21/23.
//

import Foundation
import Factory

class SplashViewModel:
    AnyViewModel,
    SplashViewModelInputs,
    SplashViewModelOutputs {

    public var inputs: SplashViewModelInputs {return self}
    public var outputs: SplashViewModelOutputs {return self}

    @Injected(\.fetchUserByIDUsecase) private var fetchUserByIDUsecase
    @Injected(\.fetchUserIDFromKeychainUsecase)
    private var fetchUserIDFromKeychainUsecase

    // MARK: - Outputs:

    @Published private(set) var isUserSignedin: Bool?
    private(set) var user: UserEntity?

    // MARK: - Inputs:

    func viewDidAppear() {
        if let userID = fetchUserID() {
            searchForExistingUser(with: userID)
        } else {}
    }

    func fetchUserID() -> String? {
        let result = fetchUserIDFromKeychainUsecase.execute()
        switch result {
        case.success(let userID):
            return userID
        case .failure: break
        }
        return nil
    }
    func searchForExistingUser(with userID: String) {
        let result = fetchUserByIDUsecase.execute(userID: userID)
        switch result {
        case.success(let user):
            self.user = user
            isUserSignedin = true
        case .failure:
            break
        }

    }
}

protocol SplashViewModelInputs {
    func viewDidAppear()
}
protocol SplashViewModelOutputs {
    var user: UserEntity? {get}
    var isUserSignedin: Bool? {get}
}
