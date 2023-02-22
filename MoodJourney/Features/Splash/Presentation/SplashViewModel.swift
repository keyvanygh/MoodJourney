//
//  SplashView.swift
//  MoodJourney
//
//  Created by sh on 2/21/23.
//

import Foundation
import Factory

class SplashViewModel: ObservableObject{
    @Published var userSignedin: Bool? = nil
    @Injected(Container.fetchUserByIDUsecase) private var fetchUserByIDUsecase
    fetchUserIDFromKeychainUsecase()
    var user: UserEntity? = nil

    func searchForExistingUser() {
        do{
            let userID = try kcm.read(.userID)
            let result = fetchUserByIDUsecase.execute(userID: userID)
            switch(result){
            case.success(let user):
                self.user = user
                userSignedin = true
                break
            case .failure(_):
                break
            }
        }catch{}
    }
}
