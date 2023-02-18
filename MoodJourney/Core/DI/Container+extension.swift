//
//  Container+extension.swift
//  NYC HighSchools
//
//  Created by sh on 1/19/23.
//

import Foundation
import Factory

extension Container {
    static let baseRequest = Factory(scope: .singleton) { BaseRequests() }

    static let fetchHighSchoolsSATsRemoteDataSource = Factory { FetchHighSchoolsSATsRemoteDataSource(requests: baseRequest()) }

    static let highSchoolsSATsRepository = Factory { HighSchoolsSATsRepository(remoteDataSource: fetchHighSchoolsSATsRemoteDataSource()) }

    static let fetchHighSchoolSATUseCase = Factory { FetchHighSchoolSATUseCase(repository: highSchoolsSATsRepository()) }

    static let fetchHighSchoolsListRemoteDataSource = Factory { FetchHighSchoolsRemoteDataSource(requests: baseRequest()) }

    static let highSchoolsListRepository = Factory { HighSchoolsListRepository(remoteDataSource: fetchHighSchoolsListRemoteDataSource()) }

    static let fetchHighSchoolsUseCase = Factory { FetchHighSchoolsUseCase(repository: highSchoolsListRepository()) }

}
