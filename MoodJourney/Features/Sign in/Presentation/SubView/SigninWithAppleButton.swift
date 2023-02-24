//
//  SigninWithAppleButton.swift
//  MoodJourney
//
//  Created by Keyvan on 2/16/23.
//

import SwiftUI
import AuthenticationServices

struct SigninWithAppleButton: View {
    @ObservedObject var vm: SigninViewModel
    var body: some View {
        SignInWithAppleButton(.signIn) { request in
            request.requestedScopes = [.fullName, .email]
        } onCompletion: { result in
            switch result {
            case .success(let authorization):
                if let credential =
                    authorization.credential as? ASAuthorizationAppleIDCredential {
                    vm.inputs.didSucceed3rdPartySignin(
                        thirdParty: .apple,
                        userID: credential.user,
                        hasImage: false,
                        name: credential.fullName?.givenName,
                        family: credential.fullName?.familyName,
                        imageURL: nil)
                }
            case .failure(let error):
                vm.inputs.didFailed3rdPartySignin(
                    thirdParty: .apple, error: error)
            }
        }
    }
}

struct SigninWithAppleButton_Previews: PreviewProvider {
    static var previews: some View {
        SigninWithAppleButton(
            vm: SigninViewModel())
    }
}
