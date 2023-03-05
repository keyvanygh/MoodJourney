//
//  HomeLocalDatasouce.swift
//  MoodJourney
//
//  Created by Keyvan on 2/22/23.
//

import Foundation
import Factory
class HomeLocalDatasource {
    @Injected(\.dbm) private var dbm: DatabaseManager

    func fetchHome(for user: UserEntity) throws -> [FeelingEntity] {
        guard let feelings = try dbm.fetch(entity: .feeling) as? [FeelingEntity] else {return []}
        return feelings.filter({$0.user?.userID != user.userID && $0.user != nil})
    }
}
