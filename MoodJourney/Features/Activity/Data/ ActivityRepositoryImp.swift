//
//   ActivityRepositoryImp.swift
//  MoodJourney
//
//  Created by Keyvan on 2/18/23.
//

import Foundation

class ActivityRepositoryImp: ActivityRepository {
    let lds : ActivityLocalDatasource
    init(localDs: ActivityLocalDatasource) {
        self.lds = localDs
    }
    /// fetch all activities
    /// - Returns:
    ///   - success: list of activities
    ///   - fail: ActivityError
    func fetchActivities() -> Result<[ActivityEntity],Error> {
        do{return .success(try lds.fetchActivies())}
        catch {return .failure(AnyError.error)}
    }
}
