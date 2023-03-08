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
        } onCompletion: { _ in
            vm.inputs.appleSinginCallback()
//            switch result {
//            case .success(let authorization):
//                if let credential =
//                    authorization.credential as? ASAuthorizationAppleIDCredential {
//                    vm.inputs.didSucceed3rdPartySignin(
//                        thirdParty: .apple,
//                        userID: credential.user,
//                        hasImage: false,
//                        name: credential.fullName?.givenName,
//                        family: credential.fullName?.familyName,
//                        imageURL: nil)
//                }
//            case .failure(let error):
//                vm.inputs.didFailed3rdPartySignin(
//                    thirdParty: .apple, error: error)
//            }
        }
    }
}

struct SigninWithAppleButton_Previews: PreviewProvider {
    static var previews: some View {
        SigninWithGoogleButton(vm: Container.shared.signinViewModel())
    }
}
