//
//  ContentView.swift
//  MoodJourney
//
//  Created by Keyvan on 2/15/23.

import SwiftUI
import Factory

struct SigninView: View {
    @StateObject var vm: SigninViewModel = Container.shared.signinViewModel()
    @EnvironmentObject private var coordinator: Coordinator
    var body: some View {
        VStack {
            SigninWithAppleButton(vm: vm)
                .frame(height: 44)
                .padding(.top, 188)
                .padding(.bottom, 12)
                .padding(.horizontal, 32)
            SigninWithGoogleButton(vm: vm)
                .frame(height: 44)
                .padding(.bottom, 188)

        }
        .background(Color.green.ignoresSafeArea())
        .onChange(of: vm.outputs.user) { _ in
            guard let user = vm.outputs.user else {return}
            coordinator.push(.activity(user: user))
        }
    }

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        SigninView(vm: Container.shared.signinViewModel())
    }
}
