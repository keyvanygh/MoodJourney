//
//  MockNetworkManager.swift
//  MoodJourneyTests
//
//  Created by Keyvan on 2/26/23.
//

import Foundation
@testable import MoodJourney

class MockNetworkManager: NetworkManager {
    
    let response: Data?
    let willSucceed: Bool
    
    init(
        response: Data? = nil,
        willSucceed: Bool) {
            self.response = response
            self.willSucceed = willSucceed
        }
    
    func get() throws -> Data {
        return try handleRequest()
    }
    
    func post() throws -> Data {
        return try handleRequest()

    }
    
    func path() throws -> Data {
        return try handleRequest()

    }
    
    func delete() throws -> Data {
        return try handleRequest()

    }
    
    private func handleRequest() throws -> Data {
        guard willSucceed else {throw(AnyError.error)}
        guard let response = response else {throw(AnyError.error)}
        return response
    }
}
