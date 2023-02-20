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

struct CoordinatorView: View {
    @StateObject var coordinator : Coordinator = Coordinator()
    var body: some View {
        NavigationStack(path: $coordinator.path) {
            coordinator.build(view: .Signin)
                .navigationDestination(for: AppView.self) { view in
                    coordinator.build(view: view)
                }
        }
        .environmentObject(coordinator)
    }
    
}
enum AppView: Hashable {
    
    case Activity(user: UserEntity)
    case Feeling(activity: ActivityEntity)
    case Profile(user: UserEntity)
    case Signin
    var id: String {
        switch(self){
        case .Activity(_): return "Activity"
        case .Feeling(_): return "Feeling"
        case .Profile(_): return "Profile"
        case .Signin: return "Signin"
        }
    }
    
}
