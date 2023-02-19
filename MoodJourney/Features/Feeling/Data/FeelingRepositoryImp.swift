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
    func addFeeling(activityID: String, feeling: Feelings) -> Result<Bool,Error> {
        do{
            try localDatasource.addFeeling(FeelingDataModel(feeling: feeling))
            try localDatasource.fetchFeelings()
            return .success(true)
        }catch(let error) {
            return .failure(error)
        }
    }
}
