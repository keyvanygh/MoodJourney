//
//  CoordinatorView.swift
//  MoodJourney
//
//  Created by Keyvan on 2/20/23.
//

import SwiftUI

struct CoordinatorView: View {
    @StateObject var coordinator: Coordinator = Coordinator()
    var root: AppView = .splash
    var body: some View {
        NavigationStack(path: $coordinator.path) {
            coordinator.build(view: root)
                .navigationDestination(for: AppView.self) { view in
                    coordinator.build(view: view)
                }
        }
        .environmentObject(coordinator)
    }

}

struct CoordinatorView_Previews: PreviewProvider {
    static var previews: some View {
        CoordinatorView()
    }
}
