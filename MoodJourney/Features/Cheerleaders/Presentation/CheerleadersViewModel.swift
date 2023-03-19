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
    
    @LazyInjected(\.fetchCheerleaders)
    private var fetchCheerleaders
    @LazyInjected(\.cheerLeadersLocalDatasource)
    private var cheerLeadersLocalDatasource
    
    private var user: UserEntity?
    
    init(user: UserEntity) {
        self.user = user
    }
    init() {}
    //
    // MARK: - Outputs
    @Published private(set) var cheerLeaders: [UserEntity] = []
    
    // MARK: - Inputs
    func fetchCheerLeaders() {
        guard let user = user else {return}
        let result = fetchCheerleaders(of: user)
        switch result {
        case .success(let result):
            cheerLeaders = result
        case .failure:
            break
        }
        
    }
    
    // MARK: - Helper
    var index = 0
    func addCheerleader() {
        
        //        let names = ["Tara","Fati","Fateme","Atvando"]
        //        if index < names.count{
        ////            guard let cheerleader = try? cheerLea
        // dersLocalDatasource.addUser(userID: names[index]) else {return}
        //            guard let user = user else {return}
        //            cheerLeadersLocalDatasource.addCheerleader(cheerLeader: cheerleader, to: user)
        //            index += 1
        //        }
        fetchCheerLeaders()
        
    }
    
}
protocol CheerleadersViewModelInputs {
    func fetchCheerLeaders()
    
}
protocol CheerleadersViewModelOutputs {
    var cheerLeaders: [UserEntity] {get}
}
