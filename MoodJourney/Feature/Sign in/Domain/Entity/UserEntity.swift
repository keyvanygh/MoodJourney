//
//  UserEntity.swift
//  MoodJourney
//
//  Created by Keyvan on 2/15/23.

import Foundation

struct UserEntity {
    /// External
    public var name : String?
    public var familyName : String?
    public var givenName : String?
    public var hasImage : Bool
    public let userID : String
    public var imageURL : URL?
    /// Internal
    public let internalID : UUID = UUID()
}
