//
//  CheerleadersRepositoryImp.swift
//  MoodJourney
//
//  Created by Keyvan on 2/19/23.
//

import Foundation

class CheerleadersRepositoryImp: CheerleadersRepository {
    /// local data source
    let lds: CheerleadersLocalDatasource
    
    init(lds: CheerleadersLocalDatasource) {
        self.lds = lds
    }
    /// fetch cheerers of user
    /// - Parameters:
    ///   - user: user
    /// - Returns:
    ///   - success: list of cheerers
    ///   - fail: CheerersError
    func fetchCheerleaders(of user: UserEntity) -> Result<[UserEntity], Error> {
        do{
            return .success(try lds.fetchCheerleaders(of: user))
        }catch{return .failure(AnyError.error)}
    }
    
    
}
