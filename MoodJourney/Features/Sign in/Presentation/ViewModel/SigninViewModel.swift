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
    
    public func googleSigninCallback(result: GIDSignInResult?,error: Error?){
        if let error = error { /* show error */ }
        guard let userID = result?.user.userID else {/* show error */ }
        let result = signinWithGoogle(userID: userID)
        switch result {
        case .success(let user):
            break
        case .failure(let error):
            break
        }
    }
    public func appleSinginCallback(result: GIDSignInResult?,error: Error?){
        
    }
    public func didSucceed3rdPartySignin(
        thirdParty: ThirdParty,
        userID: String,
        hasImage: Bool?,
        name: String?,
        family: String?,
        imageURL: URL?) {
            signin(
                userID: userID,
                hasImage: hasImage,
                name: name,
                family: family, imageURL: imageURL)
        }
    
    public func didFailed3rdPartySignin(
        thirdParty: ThirdParty,
        error: Error) {
        }
    
    private func signin(
        userID: String,
        hasImage: Bool?,
        name: String?,
        family: String?,
        imageURL: URL?) {
            let result =
            signinWithGoogle.execute(
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
    func didSucceed3rdPartySignin(
        thirdParty: ThirdParty,
        userID: String,
        hasImage: Bool,
        name: String?,
        family: String?,
        imageURL: URL?)
    func didFailed3rdPartySignin(thirdParty: ThirdParty, error: Error)
}
protocol SigninViewModelOutputs {
    var user: UserEntity? {get}
}
