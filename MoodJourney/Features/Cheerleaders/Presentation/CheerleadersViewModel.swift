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
    @LazyInjected(Container.cheerLeadersLocalDatasource) private var cheerLeadersLocalDatasource
    
    private var user: UserEntity? = nil
    
    init(user: UserEntity) {
        self.user = user
    }
    init(){}
    //
    //MARK: - Outputs
    @Published private(set) var cheerLeaders: [UserEntity] = []
    
    
    //MARK: - Inputs
    func fetchCheerLeaders() {
        addUser()
        guard let user = user else {return}
        let result = fetchCheerleadersUsecase.execute(of: user)
        switch result{
        case .success(let result):
            cheerLeaders = result
            break
        case .failure(_):
            break
        }
        
    }
    
    //    //MARK: - Helper
    func addUser(){
        guard let cheerleader = try? cheerLeadersLocalDatasource.addUser(userID: "Tara") else {return}
        guard let user = user else {return}
        cheerLeadersLocalDatasource.addCheerleader(cheerLeader: cheerleader, to: user)
    }
    
    
}
protocol CheerleadersViewModelInputs {
    func fetchCheerLeaders()
    
}
protocol CheerleadersViewModelOutputs {
    var cheerLeaders: [UserEntity] {get}
}
