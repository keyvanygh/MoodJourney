//
//  HomeRepositoryImp.swift
//  MoodJourney
//
//  Created by Keyvan on 2/22/23.
//

import Foundation

class HomeRepositoryImp: HomeRepository {
    let lds: HomeLocalDatasource
    init(lds: HomeLocalDatasource){
        self.lds = lds
    }
    
    func fetchHome(for user: UserEntity) -> Result<[FeelingEntity], Error> {
        do{
            return .success(try lds.fetchHome(for: user))
        }catch{return .failure(AnyError.error)}
    }
    
    
    
}
