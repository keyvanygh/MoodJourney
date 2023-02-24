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
                if let credential = authorization.credential as? ASAuthorizationAppleIDCredential {
                    vm.inputs.didSucceed3rdPartySignin(
                        thirdParty: .Apple,
                        userID: credential.user,
                        hasImage: false,
                        name: credential.fullName?.givenName,
                        family: credential.fullName?.familyName,
                        imageURL: nil)
                }
                break
            case .failure(let error):
                vm.inputs.didFailed3rdPartySignin(
                    thirdParty: .Apple, error: error)
                break
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
