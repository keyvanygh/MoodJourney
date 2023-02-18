//
//  ActivityEntity.swift
//  MoodJourney
//
//  Created by sh on 2/17/23.
//

import Foundation

struct ActivityEntity {
    let activityID: String
    let internalID : UUID = UUID()
    let name : String
    let image : URL?
    init(activityID: String, name: String = "defual", image: URL? = nil) {
        self.activityID = activityID
        self.name = name
        self.image = image
    }
}