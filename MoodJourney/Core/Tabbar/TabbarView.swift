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
                ActivitiesView(vm: ActivitiesViewModel(user: user))
                    .tabItem {
                        Text("Hi")
                    }
                    .environmentObject(coordinator)
            }
            HomeView()
                .tabItem {
                    Text("Hi2")
                }
                .environmentObject(coordinator)
            
        }
    }
}
import CoreData
struct TabbarView_Previews: PreviewProvider {
    static var previews: some View {
        TabbarView(vm: TabbarViewModel())
    }
}

