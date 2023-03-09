//
//  FeelingRepository.swift
//  MoodJourney
//
//  Created by Keyvan on 2/17/23.
//

import Foundation

class FeelingRepositoryImp: FeelingRepository {
    
    let lds: FeelingLocalDatasource
    let rds: Int = 0
    
    init(localDatasource: FeelingLocalDatasource) {
        self.lds = localDatasource
    }

    /// add feeling to activity with acitivtyID
    /// - Parameters:
    ///   - activityID: activity id
    ///   - feeling: feeling
    ///   - message: some explanation for the feeling
    ///   - imageURLString: image url absoluteString
    /// - Returns:
    ///   - success: array of FeelingEntitys
    ///   - fail: FeelingError
    func addFeeling(
        feeling: Feeling,
        message: String?,
        imageURLString: String?,
        to activity: ActivityEntity) -> Result<Bool, Error> {
            do {
                _ = try lds.addFeeling(
                    feeling: feeling.rawValue,
                    message: message,
                    imageURLString: imageURLString,
                    to: activity)
                return .success(true)
            } catch let error {
                return .failure(error)
            }
        }

    /// fetch feelings from activity with activityID
    /// - Parameters:
    ///   - activityID: activity id
    /// - Returns:
    ///   - success: array of FeelingEntitys
    ///   - fail: FeelingError
    func fetchFeelings(fromActivity activityID: String) -> Result<[FeelingEntity], Error> {
        do {
            let result = try lds.fetchFeelings(fromActivity: activityID)
            return .success(result)
        } catch {
            return .failure(AnyError.error)
        }
    }

    /// fetch feelings from activity with activityID
    /// - Parameters:
    ///   - activityID: activity id
    /// - Returns:
    ///   - success: array of FeelingEntitys
    ///   - fail: FeelingError
    func fetchFeelings(of activity: ActivityEntity) -> Result<[FeelingEntity], Error> {
        do {
            let result = try lds.fetchFeelings(of: activity)
            return .success(result)
        } catch {
            return .failure(AnyError.error)
        }
    }
}
