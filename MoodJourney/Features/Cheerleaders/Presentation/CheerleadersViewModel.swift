//
//  CheerleadersViewModel.swift
//  MoodJourney
//
//  Created by Keyvan on 2/19/23.
//

import Foundation
import Factory

class CheerleadersViewModel:
    AnyViewModel,
    CheerleadersViewModelInputs,
    CheerleadersViewModelOutputs {
    
    public var inputs: CheerleadersViewModelInputs {return self}
    public var outputs: CheerleadersViewModelOutputs {return self}
    
    @LazyInjected(Container.fetchCheerleadersUsecase) private var fetchCheerleadersUsecase
    private let userID: String
    
    init(userID: String) {
        self.userID = userID
    }
    
    //MARK: - Outputs
    @Published private(set) var cheerLeaders: [UserEntity] = []
    
    
    //MARK: - Inputs
    func fetchCheerLeaders() {
        let result = fetchCheerleadersUsecase.execute(userID: "userId")
        switch result{
        case .success(let result):
            cheerLeaders = result
            break
        case .failure(_):
            break
        }
    }
    
}
protocol CheerleadersViewModelInputs {
    func fetchCheerLeaders()
    
}
protocol CheerleadersViewModelOutputs {
    var cheerLeaders: [UserEntity] {get}
}
