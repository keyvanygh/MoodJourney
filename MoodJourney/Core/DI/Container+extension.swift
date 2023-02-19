//
//  Container+extension.swift
//  MoodJourney
//
//  Created by Keyvan on 2/17/23.
//

import Foundation
import Factory

extension Container {
    static let dbm = Factory {LocalDatabaseManager() }
    
    // MARK: - Feelings :
    static let feelingLocalDatasource = Factory {FeelingLocalDatasource() }
    static let feelingRepository = Factory{ FeelingRepositoryImp(localDatasource: feelingLocalDatasource()) }
    static let addFeelingToActivityUsecase = Factory { AddFeelingToActivityUsecase(repository: feelingRepository()) }
    static let fetchFeelingsForActivityUsecase = Factory { FetchFeelingsForActivityUsecase(repository: feelingRepository()) }

    // MARK: - Activity :
    static let activityLocalDatasource = Factory {ActivityLocalDatasource() }
    static let activityRepository = Factory{ ActivityRepositoryImp(localDs: activityLocalDatasource()) }
    static let fetchActivitiesUsecase = Factory { FetchActivitiesUsecase(repository: activityRepository()) }
    
    // MARK: - Cheerleaders :
    static let cheerLeadersLocalDatasource = Factory {CheerleadersLocalDatasource() }
    static let cheerLeadersRepository = Factory{ CheerleadersRepositoryImp(localDatasource: cheerLeadersLocalDatasource()) }
    static let fetchCheerleadersUsecase = Factory { FetchCheerleadersUsecase(repository: cheerLeadersRepository()) }
}
