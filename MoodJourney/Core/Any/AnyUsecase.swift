//
//  AnyUsecase.swift
//  MoodJourney
//
//  Created by Keyvan on 3/7/23.
//

import Foundation

protocol AnyUsecase {
    associatedtype Repository: AnyRepository
    var repository:Repository {get}
}
