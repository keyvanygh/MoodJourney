//
//  SigninWithAppleButton.swift
//  MoodJourney
//
//  Created by sh on 2/16/23.
//

import SwiftUI
import AuthenticationServices

struct SigninWithAppleButton: View {
    @ObservedObject var viewModel : SigninViewModel
    var body: some View {
        SignInWithAppleButton(.signIn) { request in
            request.requestedScopes = [.fullName,.email]
        } onCompletion: { result in
            //notify viewModel
        }
    }
}

struct SigninWithAppleButton_Previews: PreviewProvider {
    static var previews: some View {
        SigninWithAppleButton(
            viewModel: SigninViewModel())
    }
}
