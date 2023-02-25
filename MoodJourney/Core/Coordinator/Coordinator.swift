//
//  Coordinator.swift
//  MoodJourney
//
//  Created by Keyvan on 2/19/23.
//

import SwiftUI

class Coordinator: ObservableObject {
    @Published var path = NavigationPath()

    func push(_ view: AppView) {
        path.append(view)
    }
    func pop() {
        path.removeLast()
    }

    @ViewBuilder
    func build(view: AppView) -> some View {
        switch view {
        case .activity(let user,let activities):
            ActivitiesView(vm: ActivitiesViewModel(user: user,activities: activities))
        case .feeling(let activity):
            AddFeelingView(vm: AddFeelingViewModel(activity: activity))
        case .profile(let user):
            CheerleadersView(vm: CheerleadersViewModel(user: user))
        case .signin:
            SigninView()
        case .splash:
            SplashView()
        case .reaction(let feeling):
            ReactionView(selectedFeeling: feeling)
        case .home(let user):
            HomeView(vm: HomeViewModel(user: user))
        case .tabbarView(let user):
            TabbarView(vm: TabbarViewModel(user: user))
        }
    }
}
