//
//  SigninViewModel.swift
//  MoodJourney
//
//  Created by Keyvan on 2/16/23.
//

import Foundation
import Factory

class SigninViewModel : ObservableObject {
    @Injected(Container.thirdPartySigninUsecase) var thirdPartySigninUsecase
    @Published var user : UserEntity? = nil
    func signin(userID : String){
        let result = thirdPartySigninUsecase.execute(
            thirdParty: .Apple,
            userID: userID,
            hasImage: false,
            name: "",
            family: "",
            givenName: "",
            imageURL: nil)
        switch(result){
        case .success(let result):
            user = result
            break
        case .failure(_): break
        }
        
    }
}
