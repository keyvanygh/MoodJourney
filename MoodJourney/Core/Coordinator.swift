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
        }
    }
}

struct CoordinatorView: View {
    @StateObject var coordinator : Coordinator = Coordinator()
    var body: some View {
        NavigationStack(path: $coordinator.path) {
            SigninView()
                .navigationDestination(for: AppView.self) { view in
                    coordinator.build(view: view)
                }
        }
        .environmentObject(coordinator)
    }
    
}
enum AppView: Hashable {
    
    case Activity(user: UserEntity)
    var id: UUID {UUID()}
}
