//
//  TabbarViewModel.swift
//  MoodJourney
//
//  Created by Keyvan on 2/22/23.
//

import Foundation

class TabbarViewModel: ObservableObject {

    var user: UserEntity?
    init(user: UserEntity) {
        self.user = user
    }
    init() {}
}
