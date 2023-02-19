//
//  CheerleadersViewModel.swift
//  MoodJourney
//
//  Created by Keyvan on 2/19/23.
//

import Foundation

class CheerleadersViewModel:
    AnyViewModel,
    CheerleadersViewModelInputs,
    CheerleadersViewModelOutputs {
    
    public var inputs: CheerleadersViewModelInputs {return self}
    public var outputs: CheerleadersViewModelOutputs {return self}
    
    
    @Published private(set) var cheerLeaders: [UserEntity] = []
    
    func fetchCheerLeaders() {
        
    }
    
}
protocol CheerleadersViewModelInputs {
    func fetchCheerLeaders()
    
}
protocol CheerleadersViewModelOutputs {
    var cheerLeaders: [UserEntity] {get}
}
