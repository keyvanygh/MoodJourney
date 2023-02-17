//
//  MoodEntity.swift
//  MoodJourney
//
//  Created by sh on 2/16/23.
//

import Foundation

struct FeelingEntity{
    let feeling : Feeling
    let date : Data = Data()
    let message : String?
    //Should change to voice
    let voice : String?
    let image : [URL?]
    
    init(feeling: Feeling, message: String? = "" , voice: String? = "" , image: [URL?] = []) {
        self.feeling = feeling
        self.message = message
        self.voice = voice
        self.image = image
    }
}
enum Feeling {
    case Happy,Sad,Depressed
}
