//
//  FeelingLocalDataSource.swift
//  MoodJourney
//
//  Created by Keyvan on 2/17/23.
//

import Foundation

class FeelingLocalDatasource {
    let dbm = LocalDatabaseManager()
    func addFeeling(_ feeling: FeelingDataModel) throws {
        guard let entitiy = dbm.add(entity: .Feeling) as? FeelingEntity else {throw(URLError(.badURL))}
        entitiy.message = feeling.message
        entitiy.date = feeling.date
        try dbm.save()
    }
    func addActivity(_ feeling: FeelingDataModel) throws {
        guard let entitiy = dbm.add(entity: .Activity) as? ActivityEntity else {throw(URLError(.badURL))}
        entitiy.name = "smoking"
        entitiy.activityID = "1"
        entitiy.internalID = UUID()
        entitiy.imageURLString = ""
        try dbm.save()
    }
    func fetchFeelings() throws {
        guard var fetchResutl = try dbm.fetch(entity: .Feeling) as? [FeelingEntity] else{return}
        fetchResutl.sort(by:{$0.date ?? Date() < $1.date ?? Date()})
        for i in fetchResutl {
            print(i.date)
        }
    }
    func fetchActivies() throws {
        let fetchResutl = try dbm.fetch(entity: .Activity) as? [ActivityEntity]
    }
}
