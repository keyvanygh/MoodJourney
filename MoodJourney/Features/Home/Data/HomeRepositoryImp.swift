//
//  HomeRepositoryImp.swift
//  MoodJourney
//
//  Created by Keyvan on 2/22/23.
//

import Foundation

class HomeRepositoryImp: HomeRepository {
    let lds: HomeLocalDatasource
    init(lds: HomeLocalDatasouce){
        self.lds = lds
    }
    
    func fetchHome() -> Result<[FeelingEntity], Error> {
        
    }
    
    
    
}
