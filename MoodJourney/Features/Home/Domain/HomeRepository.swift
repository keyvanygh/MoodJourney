//
//  HomeRepository.swift
//  MoodJourney
//
//  Created by Keyvan on 2/22/23.
//

import Foundation

protocol HomeRepository {

    func fetchHome() -> Result<[FeelingEntity],Error>
}
