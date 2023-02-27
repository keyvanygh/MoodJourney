//
//  UserDataModel.swift
//  MoodJourney
//
//  Created by Keyvan on 2/16/23.
//

import Foundation

/// will be used to decode remote datasource response
struct UserDataModel: Codable {
    let userID: String
    let signedWith: String
    let name: String?
    let family: String?
    let imageURLString: String?
}
