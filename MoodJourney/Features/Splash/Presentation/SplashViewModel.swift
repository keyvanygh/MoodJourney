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
    @Injected(Container.fetchUserIDFromKeychainUsecase) private var fetchUserIDFromKeychainUsecase
    var user: UserEntity? = nil
    
    func startFlow() {
        if let userID = fetchUserID() {
            searchForExistingUser(with: userID)
        }else{}
    }
    
    func fetchUserID() -> String? {
        let result = fetchUserIDFromKeychainUsecase.execute()
        switch(result){
        case.success(let userID):
            return userID
        case .failure(_):break
        }
        return nil
    }
    func searchForExistingUser(with userID: String) {
        do{
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
