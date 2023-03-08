//
//  SigninWithGoogleButton.swift
//  MoodJourney
//
//  Created by sh on 2/16/23.
//

import SwiftUI
import GoogleSignIn
import Factory

struct SigninWithGoogleButton: View {
    @ObservedObject var vm: SigninViewModel
    var body: some View {
        HStack(spacing: 0 ) {
            Spacer()
            HStack(spacing: 4) {
                Image("google")
                    .resizable()
                    .frame(width: 15)
                    .frame(height: 15)
                Text("Sign in with Google")
                    .font(.system(size: 17, weight: .bold))
                    .foregroundColor(Color.black)
            }
            Spacer()
        }
        .onTapGesture {
            guard let presentingViewController =
                    (UIApplication.shared.connectedScenes.first as? UIWindowScene)?
                .windows.first?.rootViewController else {return}
            GIDSignIn.sharedInstance.signIn(
                withPresenting: presentingViewController) { (signInResult,error) in
                    vm.googleSigninCallback(result: signin, error: error)
                    
//                    if let error = error {
//                        vm.didFailed3rdPartySignin(thirdParty: .google, error: error)
//                        return
//                    }
//                    guard let userID = signInResult?.user.userID else {return}
//                    vm.inputs.didSucceed3rdPartySignin(
//                        thirdParty: .google,
//                        userID: userID,
//                        hasImage: signInResult?.user.profile?.hasImage,
//                        name: signInResult?.user.profile?.name,
//                        family: signInResult?.user.profile?.familyName,
//                        imageURL: signInResult?
//                            .user.profile?.imageURL(withDimension: 256))
                }
        }
        .frame(height: 44)
        .background(Color.white)
        .cornerRadius(6)
        .padding(.horizontal, 32)
    }
}

struct SigninWithGoogleButton_Previews: PreviewProvider {
    static var previews: some View {
        SigninWithGoogleButton(vm: Container.shared.signinViewModel())
    }
}
