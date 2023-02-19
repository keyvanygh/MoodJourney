//
//  ActivitiesViewModel.swift
//  MoodJourney
//
//  Created by Keyvan on 2/18/23.
//

import Foundation

class ActivitiesViewModel:
    AnyViewModel,
    ActivitiesViewModelInput,
    ActivitiesViewModelOutput {
    
    public var inputs: ActivitiesViewModelInput { return self }
    public var outputs: ActivitiesViewModelOutput { return self }
    let fetchActivitiesUsecase : FetchActivitiesUsecase = FetchActivitiesUsecase(repository: ActivityRepositoryImp())
    
    // MARK: - Outputs
    @Published var activities: [ActivityEntity] = []
    
    
    // MARK: - Inputs
    func fetchActivies() {
        let result = fetchActivitiesUsecase.execute()
        switch result{
        case .success(let result):
            activities = result
        case .failure(_):
            break
        }
    }
}
protocol ActivitiesViewModelInput{
    func fetchActivies()
}

protocol ActivitiesViewModelOutput{
    var activities: [ActivityEntity] { get }
}
