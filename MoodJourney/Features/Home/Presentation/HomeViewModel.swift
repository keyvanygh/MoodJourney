//
//  HomeViewModel.swift
//  MoodJourney
//
//  Created by Keyvan on 2/22/23.
//

import Foundation
import Factory

class HomeViewModel: ObservableObject {
    @Injected(\.fetchHome) private var fetchHome
    @Published var feelings: [FeelingEntity] = []
    var user: UserEntity?
    init(user: UserEntity? = nil) {
        self.user = user
    }
    init() {}
    func fetchHomePage() {
        guard let user = user else {return}
        let result = fetchHome(of: user)
        switch result {
        case.success(let feelings):
            self.feelings = feelings
            self.feelings.remove(at: 0)
        case . failure: break
        }
    }
}
