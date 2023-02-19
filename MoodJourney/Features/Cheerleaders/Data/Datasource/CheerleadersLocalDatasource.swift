//
//  CheerleadersLocalDatasource.swift
//  MoodJourney
//
//  Created by Keyvan on 2/19/23.
//

import Foundation
import Factory

class CheerleadersLocalDatasource {
    @LazyInjected(Container.dbm) private var dbm
    
    func fetchCheerleaders(userID: String) throws -> [UserEntity] {
        guard let cheerleaders = try dbm.fetch(entity: .User) as? [UserEntity] else {throw(AnyError.error)}
        return cheerleaders
    }
}
