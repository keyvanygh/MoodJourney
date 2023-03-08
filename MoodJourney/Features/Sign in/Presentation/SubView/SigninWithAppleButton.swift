//
//  SigninWithAppleButton.swift
//  MoodJourney
//
//  Created by Keyvan on 2/16/23.
//

import SwiftUI
import Factory
import AuthenticationServices

struct SigninWithAppleButton<ViewModel>: View where ViewModel: SigninViewModel {
    @ObservedObject var vm: ViewModel
    var body: some View {
        SignInWithAppleButton(.signIn) { request in
            request.requestedScopes = [.fullName, .email]
        } onCompletion: { result in
            vm.inputs.appleSinginCallback(result)
        }
    }
}

struct SigninWithAppleButton_Previews: PreviewProvider {
    static var previews: some View {
        SigninWithGoogleButton(vm: Container.shared.signinViewModel())
    }
}
