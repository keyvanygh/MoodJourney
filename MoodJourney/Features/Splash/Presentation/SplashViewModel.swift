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
    @Injected(Container.kcm) private var kcm: KeychainManager
    func searchForExistingUser() {
        do{
            _ = try kcm.read(.userID)
            userSignedin = true
        }catch{}
    }
}
