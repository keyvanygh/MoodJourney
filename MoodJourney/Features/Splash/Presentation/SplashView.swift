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
                vm.searchForExistingUser()
            }
            .onChange(of: vm.userSignedin) { userSignedin in
                guard let userSignedin = userSignedin else{return}
                if !userSignedin {coordinator.push(.Signin)}
            }
    }
    
}

struct SplashView_Previews: PreviewProvider {
    static var previews: some View {
        SplashView(vm: SplashViewModel())
    }
}
