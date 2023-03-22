//
//  HomeLocalDatasouce.swift
//  MoodJourney
//
//  Created by Keyvan on 2/22/23.
//

import Foundation
import Factory
class HomeLocalDatasourceImp: HomeLocalDatasource {
    
    private var dbm: CoreDataManager
    init(dbm: CoreDataManager) {
        self.dbm = dbm
    }
    
    func fetchHome(for user: UserEntity) throws -> [FeelingEntity] {
        guard let feelings = try dbm.fetch(entity: .feeling) as? [FeelingEntity] else {return []}
        return feelings.filter({$0.user?.userID != user.userID && $0.user != nil})
    }
}
protocol HomeLocalDatasource {
    func fetchHome(for user: UserEntity) throws -> [FeelingEntity]
}
