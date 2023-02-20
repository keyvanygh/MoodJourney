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
        guard let user = user else {return}
        cheerLeaders = []
        let result = fetchCheerleadersUsecase.execute(of: user)
        switch result{
        case .success(let result):
            print(result.last?.userID)
            cheerLeaders = result
            break
        case .failure(_):
            break
        }
        
    }
    
    //    //MARK: - Helper
    var index = 0
    func addCheerleader(){
        fetchCheerLeaders()

        let names = ["Parham","Tara"]
        if index < names.count{
//            print("HI")
            print((user?.cheerleaders?.allObjects as? [UserEntity])?.count)
            guard let cheerleader = try? cheerLeadersLocalDatasource.addUser(userID: names[index]) else {return}
            print(cheerleader)
            guard let user = user else {return}
            cheerLeadersLocalDatasource.addCheerleader(cheerLeader: cheerleader, to: user)
            index += 1
        }

    }
    
    
}
protocol CheerleadersViewModelInputs {
    func fetchCheerLeaders()
    
}
protocol CheerleadersViewModelOutputs {
    var cheerLeaders: [UserEntity] {get}
}
