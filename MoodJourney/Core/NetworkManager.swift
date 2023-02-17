//
//  NetworkManager.swift
//  MoodJourney
//
//  Created by sh on 2/16/23.
//

import Foundation

protocol INetworkManager {
    
    func get() throws -> Data
    func post() throws -> Data
    func path() throws -> Data
    func delete() throws -> Data
}

//class NetworkManager : INetworkManager{
//    
//}
