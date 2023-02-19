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
    
    func signin(userID : String){
        let result = thirdPartySigninUsecase.execute(
            thirdParty: .Apple,
            userID: userID,
            hasImage: false,
            name: "",
            family: "",
            givenName: "",
            imageURL: nil)
        print(result)
    }
}
