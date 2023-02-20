//
//  SigninViewModel.swift
//  MoodJourney
//
//  Created by Keyvan on 2/16/23.
//

import Foundation
import Factory

class SigninViewModel :
    AnyViewModel,
    SigninViewModelInputs,
    SigninViewModelOutputs {
    
    public var inputs: SigninViewModelInputs {return self}
    public var outputs: SigninViewModelOutputs {return self}
    
    @Injected(Container.thirdPartySigninUsecase) var thirdPartySigninUsecase
    @Published var user : UserEntity? = nil
    
    func didSucceed3rdPartySignin(thirdParty: ThirdParty, userID: String, hasImage: Bool, name: String?, family: String?, imageURL: URL?) {
        signin(thirdParty: thirdParty,
               userID: userID,
               hasImage: hasImage,
               name: name,
               family: family, imageURL: imageURL)
    }
    
    func didFailed3rdPartySignin(thirdParty: ThirdParty, error: Error) {
        //TODO: - implemnt fail
    }
    
    private func signin(
        thirdParty: ThirdParty,
        userID: String,
        hasImage: Bool,
        name: String?,
        family: String?,
        imageURL: URL?) {
            let result =
            thirdPartySigninUsecase.execute(
                thirdParty: thirdParty,
                userID: userID,
                hasImage: hasImage,
                name: name,
                family: family,
                imageURL: imageURL)
            switch(result){
            case .success(let result):
                user = result
                break
            case .failure(_): break
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
    func didFailed3rdPartySignin(thirdParty: ThirdParty,error: Error)
}
protocol SigninViewModelOutputs {
    var user : UserEntity? {get}
}

