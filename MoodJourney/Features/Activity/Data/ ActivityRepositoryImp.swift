//
//   ActivityRepositoryImp.swift
//  MoodJourney
//
//  Created by Keyvan on 2/18/23.
//

import Foundation

class ActivityRepositoryImp: ActivityRepository {
    let localDs = ActivityLocalDatasource()
    func fetchActivities() -> Result<[ActivityEntity],Error> {
        do{return .success(try localDs.fetchActivies())}
        catch {return .failure(AnyError.error)}
    }
}
