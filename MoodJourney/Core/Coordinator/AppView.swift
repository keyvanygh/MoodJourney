//
//  Views.swift
//  MoodJourney
//
//  Created by Keyvan on 2/20/23.
//

import Foundation

enum AppView: Hashable {
    case Activity(user: UserEntity)
    case Feeling(activity: ActivityEntity)
    case Profile(user: UserEntity)
    case Signin
    case Splash
    case Reaction(feeling: FeelingEntity)
    case Home(user: UserEntity)
    case TabbarView(user: UserEntity)

}
