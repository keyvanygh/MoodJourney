//
//  Coordinator.swift
//  MoodJourney
//
//  Created by Keyvan on 2/19/23.
//

import SwiftUI

class Coordinator: ObservableObject {
    @Published var path = NavigationPath()
    
    func push(_ view: AppView){
        path.append(view)
    }
    func pop(){
        path.removeLast()
    }
    
    @ViewBuilder
    func build(view: AppView) -> some View{
        switch(view){
        case .Activity(let user):
            ActivitiesView(vm: ActivitiesViewModel(user: user))
        case .Feeling(let activity):
            AddFeelingView(vm: AddFeelingViewModel(activity: activity))
        case .Profile(let user):
            CheerleadersView(vm: CheerleadersViewModel(user: user))
        case .Signin:
            SigninView()
        }
    }
}
