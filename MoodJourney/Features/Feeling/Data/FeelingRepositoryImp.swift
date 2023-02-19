//
//  FeelingRepository.swift
//  MoodJourney
//
//  Created by Keyvan on 2/17/23.
//

import Foundation

class FeelingRepositoryImp : FeelingRepository {
    let localDatasource : FeelingLocalDatasource
    init(localDatasource: FeelingLocalDatasource) {
        self.localDatasource = localDatasource
    }
    func addFeeling(
        activityID: String,
        feeling: Feelings,
        message: String?,
        imageURLString: String?) -> Result<Bool,Error> {
        do {
            _ = try localDatasource.addFeeling(
                toActicity: activityID,
                feeling: feeling.rawValue,
                message: message,
                imageURLString: imageURLString)
            return .success(true)
        }catch(let error) {
            return .failure(error)
        }
    }
    func fetchFeelings(fromActivity activityID: String) -> Result<[FeelingEntity],Error>{
        do {
            let result = try localDatasource.fetchFeelings(fromActivity: activityID)
            return .success(result)
        }catch{
            return .failure(AnyError.error)
        }
    }
}
