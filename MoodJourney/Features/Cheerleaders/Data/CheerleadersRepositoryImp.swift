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
    func fetchCheerleaders(of user: UserEntity) -> Result<[UserEntity], Error> {
        do{
            return .success(try localDatasource.fetchCheerleaders(of: user))
        }catch{return .failure(AnyError.error)}
    }
    
    
}
