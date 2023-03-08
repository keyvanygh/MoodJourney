//
//  SigninWithAppleButton.swift
//  MoodJourney
//
//  Created by Keyvan on 2/16/23.
//

import SwiftUI
import Factory
import AuthenticationServices

struct SigninWithAppleButton: View {
    @ObservedObject var vm: SigninViewModel
    var body: some View {
        SignInWithAppleButton(.signIn) { request in
            request.requestedScopes = [.fullName, .email]
        } onCompletion: { result in
            vm.inputs.appleSinginCallback()
        }
    }
}

struct SigninWithAppleButton_Previews: PreviewProvider {
    static var previews: some View {
        SigninWithAppleButton(
            vm: Container.shared.signinViewModel())
    }
}
