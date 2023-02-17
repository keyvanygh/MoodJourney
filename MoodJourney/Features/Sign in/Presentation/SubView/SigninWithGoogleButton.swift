//
//  SigninWithGoogleButton.swift
//  MoodJourney
//
//  Created by sh on 2/16/23.
//

import SwiftUI
import GoogleSignIn

struct SigninWithGoogleButton: View {
    @ObservedObject var viewModel : SigninViewModel
    var body: some View {
        HStack(spacing: 0 ){
            Spacer()

            HStack(spacing: 4){
                Image("google")
                    .resizable()
                    .frame(width: 15)
                    .frame(height: 15)
                Text("Sign in with Google")
                    .font(.system(size: 17,weight: .bold))
                    .foregroundColor(Color.black)
                
            }
            Spacer()

        }
        .onTapGesture {
            guard let presentingViewController = (UIApplication.shared.connectedScenes.first as? UIWindowScene)?.windows.first?.rootViewController else {return}
            GIDSignIn.sharedInstance.signIn(withPresenting: presentingViewController) { signInResult, error in
                // check `error`; do something with `signInResult
                guard let userID = signInResult?.user.userID else{return}
                viewModel.signin(userID: userID)
                
            }
        }
        .frame(height : 44)
        .background(Color.white)
        .cornerRadius(6)
        .padding(.horizontal,32)
    }
}

struct SigninWithGoogleButton_Previews: PreviewProvider {
    static var previews: some View {
        SigninWithGoogleButton(viewModel: SigninViewModel())
    }
}
