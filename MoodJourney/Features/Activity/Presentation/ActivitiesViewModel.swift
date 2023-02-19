//
//  ActivitiesViewModel.swift
//  MoodJourney
//
//  Created by Keyvan on 2/18/23.
//

import Foundation
import Factory

class ActivitiesViewModel:
    AnyViewModel,
    ActivitiesViewModelInput,
    ActivitiesViewModelOutput {
    
    public var inputs: ActivitiesViewModelInput { return self }
    public var outputs: ActivitiesViewModelOutput { return self }
    @Injected(Container.fetchActivitiesUsecase) private(set) var fetchActivitiesUsecase
    
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
    // MARK: -  HELPER
    func addActivity(){
        let lds = ActivityLocalDatasource()
        _ = try? lds.addActivity(
            activityID: "1",
            name: "Gain Weight",
            imageURLString: "https://legionathletics.com/wp-content/uploads/2021/04/clean-bulking-1.jpg")
        _ = try? lds.addActivity(
            activityID: "2",
            name: "Loose Weight",
            imageURLString: "https://i.kinja-img.com/gawker-media/image/upload/c_fit,f_auto,g_center,pg_1,q_60,w_1600/uztbf1vxh2eic9z01ojn.jpg")
        
    }
}
protocol ActivitiesViewModelInput{
    func fetchActivies()
}

protocol ActivitiesViewModelOutput{
    var activities: [ActivityEntity] { get }
}


