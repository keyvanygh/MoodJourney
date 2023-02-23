//
//  TabbarView.swift
//  MoodJourney
//
//  Created by Keyvan on 2/22/23.
//

import SwiftUI


struct TabbarView: View {
    @State private var selection = 0
    @StateObject var vm: TabbarViewModel
    @EnvironmentObject private var coordinator: Coordinator
    
    var body: some View {
        TabView(selection: $selection) {
            if let user = vm.user {
                
                HomeView(vm: HomeViewModel(user: user))
                    .tabItem {
                        Text("Home")
                    }
                    .environmentObject(coordinator)
            }
            if let user = vm.user {
                ActivitiesView(vm: ActivitiesViewModel(user: user))
                    .tabItem {
                        Text("Goal")
                    }
                    .environmentObject(coordinator)

            }
            if let user = vm.user {
                
                CheerleadersView(vm: CheerleadersViewModel(user: user))
                    .tabItem {
                        Text("Profile")
                    }
                    .environmentObject(coordinator)
            }
        }
    }
}
import CoreData
struct TabbarView_Previews: PreviewProvider {
    static let coordinator = Coordinator()
    static var previews: some View {
        TabbarView(vm: TabbarViewModel())
            .environmentObject(coordinator)
    }
}

