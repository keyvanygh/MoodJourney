//
//  SigninViewModel.swift
//  MoodJourney
//
//  Created by Keyvan on 2/16/23.
//

import Foundation
import GoogleSignIn
import AuthenticationServices
import Factory

public protocol SigninViewModel: AnyViewModel {
    var inputs: SigninViewModelInputs { get }
    var outputs: SigninViewModelOutputs { get }
}

class SigninViewModelImp:
    SigninViewModel,
    SigninViewModelInputs,
    SigninViewModelOutputs {
    
    public var inputs: SigninViewModelInputs {return self}
    public var outputs: SigninViewModelOutputs {return self}
    
    @Published private(set) var user: UserEntity?
    @Published private(set) var navigateToActivitiesPage: Bool = false
    
    private let signinWithGoogle: SigninWithGoogle
    private let signinWithApple: SigninWithApple

    
    init(
        signinWithGoogle: SigninWithGoogle,
        signinWithApple: SigninWithApple
    ) {
        self.signinWithGoogle = signinWithGoogle
        self.signinWithApple = signinWithApple
    }
    
    internal final func googleSigninCallback(result: GIDSignInResult?,error: Error?) {
        if let error = error { print(error) /* show error */ }
        guard let userID = result?.user.userID else { return /* show error */}
        let result = signinWithGoogle(userID: userID)
        switch result {
        case .success(let user):
            print(user)
        case .failure(let error):
            print(error)
        }
    }
    internal final func appleSinginCallback(_ result: Result<ASAuthorization,Error>) {
        switch result {
        case .success(let authorization):
            guard let credential =
                    authorization.credential as? ASAuthorizationAppleIDCredential else {return}
              let result = signinWithApple(
                    userID: credential.user,
                    hasImage: false,
                    name: credential.fullName?.givenName,
                    family: credential.fullName?.familyName,
                    imageURL: nil)
        case .failure(let error):
            print(error)
//            vm.inputs.didFailed3rdPartySignin(
//                thirdParty: .apple, error: error)
        }
    }
    
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

public protocol SigninViewModelInputs {
    func googleSigninCallback(result: GIDSignInResult?,error: Error?)
    func appleSinginCallback(_ result: Result<ASAuthorization,Error>)
}

public protocol SigninViewModelOutputs {
    var user: UserEntity? {get}
    var navigateToActivitiesPage:Bool {get}
}
