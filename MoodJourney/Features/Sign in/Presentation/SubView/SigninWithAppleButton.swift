//
//  SigninWithAppleButton.swift
//  MoodJourney
//
//  Created by Keyvan on 2/16/23.
//

import SwiftUI
import AuthenticationServices

struct SigninWithAppleButton: View {
    @ObservedObject var viewModel : SigninViewModel
    var body: some View {
        SignInWithAppleButton(.signIn) { request in
            request.requestedScopes = [.fullName,.email]
        } onCompletion: { result in
            switch(result){
            case .success(let authorization) :
                if let appleIDCredential = authorization.credential as? ASAuthorizationAppleIDCredential {
                    viewModel.signin(userID: appleIDCredential.user)
                }
                break
            case .failure(_):
                break
            }
        }
    }
}

struct SigninWithAppleButton_Previews: PreviewProvider {
    static var previews: some View {
        SigninWithAppleButton(
            viewModel: SigninViewModel())
    }
}
