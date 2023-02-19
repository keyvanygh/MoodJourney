//
//  ActivitiesViewModel.swift
//  MoodJourney
//
//  Created by Keyvan on 2/18/23.
//

import Foundation

class ActivitiesViewModel: ObservableObject {
    let fetchActivitiesUsecase : FetchActivitiesUsecase = FetchActivitiesUsecase(repository: ActivityRepositoryImp())
    
    
                                                                                 
}
