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
    @Injected(\.fetchActivitiesUsecase)
    private(set) var fetchActivitiesUsecase
    var user: UserEntity?
    init(user: UserEntity, activities: [ActivityEntity] = []) {
        self.user = user
        self.activities = activities
    }
    // for preview
    init() {}

    // MARK: - Outputs
    @Published var activities: [ActivityEntity] = []

    // MARK: - Inputs
    func fetchActivies() {
        activities = []
        let result = fetchActivitiesUsecase.execute()
        switch result {
        case .success(let result):
            activities = result
        case .failure:
            break
        }
    }
    // MARK: - HELPER
    func addActivity() {
        let lds = ActivityLocalDatasource()
        _ = try? lds.addActivity(
            activityID: "1",
            name: "Gain Weight",
            imageURLString: "")
        _ = try? lds.addActivity(
            activityID: "2",
            name: "Loose Weight",
            imageURLString: "")

    }
}
protocol ActivitiesViewModelInput {
    func fetchActivies()
}

protocol ActivitiesViewModelOutput {
    var activities: [ActivityEntity] { get }
}
