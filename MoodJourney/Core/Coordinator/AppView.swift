//
//  Views.swift
//  MoodJourney
//
//  Created by Keyvan on 2/20/23.
//

import Foundation

enum AppView: Hashable {
    case activity(user: UserEntity,
                  activities: [ActivityEntity] = [])
    case feeling(activity: ActivityEntity)
    case profile(user: UserEntity)
    case signin
    case splash
    case reaction(feeling: FeelingEntity)
    case home(user: UserEntity)
    case tabbarView(user: UserEntity)
    
}
