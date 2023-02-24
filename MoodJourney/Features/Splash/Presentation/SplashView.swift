//
//  SplashView.swift
//  MoodJourney
//
//  Created by sh on 2/21/23.
//

import SwiftUI

struct SplashView: View {
    @EnvironmentObject private var coordinator: Coordinator
    @StateObject var vm: SplashViewModel = SplashViewModel()
    var body: some View {
        Text("Splash")
            .onAppear {
                vm.inputs.viewDidAppear()
            }
            .onChange(of: vm.outputs.isUserSignedin) { isUserSignedin in
                guard let isUserSignedin = isUserSignedin else {return}
                if !isUserSignedin {coordinator.push(.signin)} else {
                    guard let user = vm.outputs.user else {return}
                    coordinator.push(.tabbarView(user: user))
                }
            }
    }

}

struct SplashView_Previews: PreviewProvider {
    static var previews: some View {
        SplashView(vm: SplashViewModel())
    }
}
