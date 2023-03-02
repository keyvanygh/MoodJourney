//
//  Mock.swift
//  MoodJourneyTests
//
//  Created by Keyvan on 3/1/23.
//

import Foundation

protocol Mock {
    func setAnswer(_ answer: Any?)
    var answer: Any? {get set}
}
extension Mock {
    func answerWith(_ answer: Any) {
        setAnswer(answer)
    }
}
