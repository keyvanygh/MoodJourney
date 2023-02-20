//
//  Coordinator.swift
//  MoodJourney
//
//  Created by sh on 2/19/23.
//

import SwiftUI

class Coordinator: ObservableObject {
    @Published var path = NavigationPath()
    
    func push(_ view: AppView){
        path.append(view)
    }
    @ViewBuilder
    func build(view: AppView) -> some View{
        switch(view){
        case .Activity(let user):
            ActivitiesView(vm: ActivitiesViewModel(user: user))
        case .Feeling(let activity):
            AddFeelingView(vm: AddFeelingViewModel(activity: activity))
        case .Profile(_):
            CheerleadersView(vm: CheerleadersViewModel())
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
    var id: UUID {UUID()}
}
