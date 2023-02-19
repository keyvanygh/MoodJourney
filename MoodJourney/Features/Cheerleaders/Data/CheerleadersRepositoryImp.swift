//
//  CheerleadersRepositoryImp.swift
//  MoodJourney
//
//  Created by Keyvan on 2/19/23.
//

import Foundation

class CheerleadersRepositoryImp: CheerleadersRepository {
    let localDatasource: CheerleadersLocalDatasource
    init(localDatasource: CheerleadersLocalDatasource) {
        self.localDatasource = localDatasource
    }
    func fetchCheerleaders(userID: String) -> Result<[UserEntity], Error> {
        do{
            return .success(try localDatasource.fetchCheerleaders(userID: userID))
        }catch{return .failure(AnyError.error)}
    }
    
    
}
