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
    
    @Published private(set) var cheerLeaders: [UserEntity] = []
    
    func fetchCheerLeaders() {
        let result = fetchCheerleadersUsecase.execute(userID: "userId")
    }
    
}
protocol CheerleadersViewModelInputs {
    func fetchCheerLeaders()
    
}
protocol CheerleadersViewModelOutputs {
    var cheerLeaders: [UserEntity] {get}
}
