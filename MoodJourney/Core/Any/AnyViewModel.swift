//
//  AnyViewModel.swift
//  MoodJourney
//
//  Created by Keyvan on 2/17/23.
//

import Foundation

public protocol AnyViewModel: ObservableObject {
    associatedtype Inputs
    associatedtype Outputs
    var inputs: Inputs { get }
    var outputs: Outputs { get }
}
