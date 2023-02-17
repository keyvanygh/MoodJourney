//
//  SigninViewModel.swift
//  MoodJourney
//
//  Created by Keyvan on 2/16/23.
//

import Foundation

class SigninViewModel : ObservableObject {
    let thirdPartySigninUsecase = ThirdPartySigninUsecase(repository: SigninRepository(thirdPartyRemoteDataSource: ThirdPartySigninRemoteDataSource(networkManager: NetworkManager(willSucceed: true))))
    
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
