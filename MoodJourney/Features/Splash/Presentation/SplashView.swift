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
            .onAppear(){
                vm.inputs.startFlow()
            }
            .onChange(of: vm.outputs.userSignedin) { userSignedin in
                guard let userSignedin = userSignedin else{return}
                if !userSignedin {coordinator.push(.Signin)}
                else{
                    guard let user = vm.outputs.user else{return}
                    coordinator.push(.Activity(user: user))
                }
            }
    }
    
}

struct SplashView_Previews: PreviewProvider {
    static var previews: some View {
        SplashView(vm: SplashViewModel())
    }
}
