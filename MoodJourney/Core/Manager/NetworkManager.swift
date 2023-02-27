//
//  NetworkManager.swift
//  MoodJourney
//
//  Created by Keyvan on 2/16/23.
//

import Foundation

protocol NetworkManager {

    func get() throws -> Data
    func post(path: String,body: [String:Any]?) throws -> Data
    func patch(path: String,body: [String:Any]?) throws -> Data
    func delete() throws -> Data
}

class NetworkManagerImp: NetworkManager {
    let willSucceed: Bool
    init(willSucceed: Bool) {
        self.willSucceed = willSucceed
    }

    func get() throws -> Data {
        if willSucceed {return Data()} else {throw(AnyError.error)}
    }
    func post(path: String, body: [String:Any]? = nil) throws -> Data {
        if willSucceed {return Data()} else {throw(AnyError.error)}
    }
    func patch(path: String, body: [String:Any]? = nil) throws -> Data {
        if willSucceed {return Data()} else {throw(AnyError.error)}
    }
    func delete() throws -> Data {
        if willSucceed {return Data()} else {throw(AnyError.error)}
    }
}
