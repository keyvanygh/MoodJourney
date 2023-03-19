//
//  Mock.swift
//  MoodJourneyTests
//
//  Created by Keyvan on 3/1/23.
//

import Foundation
@testable import MoodJourney

protocol AnyMock {
    mutating func setAnswer(_ answer: Any?)
    var answer: Any? {get set}
}
extension AnyMock {
    mutating func answerWith(_ answer: Any) {
        setAnswer(answer)
    }
    func answer<T>(_ type: Result<T,Error>.Type) -> Result<T,Error> {
        if let error = answer as? Error {return .failure(error)}
        guard let answer = answer as? T else {return .failure(AnyError.error)}
        return .success(answer)
    }
    mutating func setAnswer(_ answer: Any?) {
        self.answer = answer
    }
}
