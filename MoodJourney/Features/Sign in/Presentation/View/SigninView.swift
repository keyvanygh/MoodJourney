//
//  ContentView.swift
//  MoodJourney
//
//  Created by Keyvan on 2/15/23.

import SwiftUI
import Factory

struct SigninView<ViewModel>: View where ViewModel: SigninViewModel {
    
    @StateObject var vm: ViewModel
    @EnvironmentObject private var coordinator: Coordinator
    
    init(vm: ViewModel = Container.shared.signinViewModel()) {
        _vm = StateObject(wrappedValue: vm)
    }
    
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
        .onChange(of: vm.outputs.navigateToActivitiesPage) { shouldNavigate in
            guard shouldNavigate else {return}
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
