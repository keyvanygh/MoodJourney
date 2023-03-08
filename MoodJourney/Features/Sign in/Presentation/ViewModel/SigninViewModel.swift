//
//  SigninViewModel.swift
//  MoodJourney
//
//  Created by Keyvan on 2/16/23.
//

import Foundation
import GoogleSignIn
import Factory

class SigninViewModel:
    AnyViewModel,
    SigninViewModelInputs,
    SigninViewModelOutputs {
    
    public var inputs: SigninViewModelInputs {return self}
    public var outputs: SigninViewModelOutputs {return self}
    @Published private(set) var user: UserEntity?
    
    private let signinWithGoogle: SigninWithGoogle
    
    init(signinWithGoogle: SigninWithGoogle) {
        self.signinWithGoogle = signinWithGoogle
    }
    
    public final func googleSigninCallback(result: GIDSignInResult?,error: Error?){
        if let error = error { print(error) /* show error */ }
        guard let userID = result?.user.userID else { return /* show error */}
        let result = signinWithGoogle(userID: userID)
        switch result {
        case .success(let user):
            print(user)
            break
        case .failure(let error):
            print(error)
            break
        }
    }
    public final func appleSinginCallback() {}
    
    private func signin(
        userID: String,
        hasImage: Bool?,
        name: String?,
        family: String?,
        imageURL: URL?) {
            let result =
            signinWithGoogle(
                userID: userID,
                hasImage: hasImage,
                name: name,
                family: family,
                imageURL: imageURL)
            switch result {
            case .success(let result):
                user = result
            case .failure: break
            }
        }
}
protocol SigninViewModelInputs {
    func googleSigninCallback(result: GIDSignInResult?,error: Error?)
    func appleSinginCallback()
}
protocol SigninViewModelOutputs {
    var user: UserEntity? {get}
}
