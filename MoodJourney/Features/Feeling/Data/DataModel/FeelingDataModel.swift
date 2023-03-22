//
//  FeelingDataModel.swift
//  MoodJourney
//
//  Created by Keyvan on 2/17/23.
//

import Foundation

struct FeelingDataModel {
    let feeling: Feeling
    let date: Date
    let message: String?
    // Should change to voice
    let voice: String?
    let image: [URL?]
    let internalID: UUID
    let feelingID: String = "ID"

}
