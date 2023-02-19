//
//  MoodEntity.swift
//  MoodJourney
//
//  Created by sh on 2/16/23.
//

import Foundation

extension FeelingEntity {
    var feelingTypeEnum: Feelings{
        return Feelings(rawValue: self.feelingType ?? "") ?? .Happy
    }
}
enum Feelings: String{
    case Happy,Sad,Depressed
}
