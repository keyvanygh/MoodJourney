//
//   ActivityRepositoryImp.swift
//  MoodJourney
//
//  Created by Keyvan on 2/18/23.
//

import Foundation

class ActivityRepositoryImp: ActivityRepository {
    
    var rds = 0
    let lds: ActivityLocalDatasource
    
    init(lds: ActivityLocalDatasource) {
        self.lds = lds
    }
    /// fetch all activities
    /// - Returns:
    ///   - success: list of activities
    ///   - fail: ActivityError
    func fetchActivities() -> Result<[ActivityEntity], Error> {
        do {return .success(try lds.fetchActivies())} catch {return .failure(AnyError.error)}
    }
}
