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

//    private let user: UserEntity
//
//    init(user: UserEntity) {
//        self.user = user
//    }
//
    //MARK: - Outputs
    @Published private(set) var cheerLeaders: [UserEntity] = []
    
    
    //MARK: - Inputs
    func fetchCheerLeaders() {
        do {
            /// helper
            let user = try cheerLeadersLocalDatasource.getUser(userID: "Me")
            ///
            let result = fetchCheerleadersUsecase.execute(of: user)
            switch result{
            case .success(let result):
                cheerLeaders = result
                break
            case .failure(_):
                break
            }

        }catch{
            
        }
    }
    
//    //MARK: - Helper
    func addUser(){
        guard let user = try? cheerLeadersLocalDatasource.getUser(userID: "Me") else {return}
        guard let cheerleader = try? cheerLeadersLocalDatasource.addUser(userID: "TAra") else {return}

        cheerLeadersLocalDatasource.addCheerleader(cheerLeader: cheerleader, to: user)
    }

    
}
protocol CheerleadersViewModelInputs {
    func fetchCheerLeaders()
    
}
protocol CheerleadersViewModelOutputs {
    var cheerLeaders: [UserEntity] {get}
}
