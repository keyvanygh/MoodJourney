//
//  MoodEntity.swift
//  MoodJourney
//
//  Created by Keyvan on 2/16/23.
//

import Foundation

extension FeelingEntity {
    /// feelingTypeValue is a String stored in database representing the feeling rawValue
    /// feelingType is the enum from feelingTypeValue
    var feelingType: Feeling {
        return Feeling(rawValue: self.feelingTypeValue ?? "") ?? .Happy
    }
}
