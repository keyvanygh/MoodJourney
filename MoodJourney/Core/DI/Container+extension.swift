//
//  Container+extension.swift
//  MoodJourney
//
//  Created by Keyvan on 2/17/23.
//

import Foundation
import Factory

extension Container {
    static let dbm = Factory(scope: .singleton) {DatabaseManager() }
    static let kcm = Factory(scope: .singleton) {KeychainManager() }
    static let acm = Factory(scope: .singleton) {AccountManager() }
    static let testdbm = Factory(scope: .singleton) {TestCoreData() }
    
    // MARK: - Feelings :
    static let feelingLocalDatasource = Factory {FeelingLocalDatasource() }
    static let feelingRepository = Factory {
        FeelingRepositoryImp(localDatasource: feelingLocalDatasource()) }
    static let addFeelingToActivityUsecase = Factory {
        AddFeelingToActivityUsecase(repository: feelingRepository()) }
    static let fetchFeelingsForActivityUsecase = Factory {
        FetchFeelingsForActivityUsecase(repository: feelingRepository()) }
    
    // MARK: - Activity :
    static let activityLocalDatasource = Factory {ActivityLocalDatasource() }
    static let activityRepository = Factory {
        ActivityRepositoryImp(localDs: activityLocalDatasource()) }
    static let fetchActivitiesUsecase = Factory {
        FetchActivitiesUsecase(repository: activityRepository()) }
    
    // MARK: - Cheerleaders :
    static let cheerLeadersLocalDatasource = Factory {
        CheerleadersLocalDatasource() }
    static let cheerLeadersRepository = Factory {
        CheerleadersRepositoryImp(lds: cheerLeadersLocalDatasource()) }
    static let fetchCheerleadersUsecase = Factory {
        FetchCheerleadersUsecase(repository: cheerLeadersRepository()) }
    
    // MARK: - Signin :
    static let signinLocalDatasource = Factory {SigninLocalDatasource() }
    static let signinRemoteDataSource = Factory {
        SigninRemoteDataSource(networkManager: NetworkManager(willSucceed: true)) }
    static let signinRepository = Factory {
        SigninRepositoryImp(rds: signinRemoteDataSource(), lds: signinLocalDatasource()) }
    static let thirdPartySigninUsecase = Factory {
        ThirdPartySigninUsecase(repository: signinRepository()) }
    static let fetchUserByIDUsecase = Factory {
        FetchUserByIDUsecase(repository: signinRepository()) }
    static let fetchUserIDFromKeychainUsecase = Factory {
        FetchUserIDFromKeychainUsecase(repository: signinRepository()) }
    
    // MARK: - Reaction :
    static let reactionLocalDatasource = Factory {ReactionLocalDatasource() }
    static let reactionRepository = Factory {
        ReactionRepositoryImp(lds: reactionLocalDatasource()) }
    static let addReactionToFeelingUsecase = Factory {
        AddReactionToFeelingUsecase(repository: reactionRepository()) }
    
    // MARK: - Home :
    static let homeLocalDatasource = Factory {HomeLocalDatasource() }
    static let homeRepository = Factory {
        HomeRepositoryImp(lds: homeLocalDatasource()) }
    static let fetchHomeUsecase = Factory {
        FetchHomeUsecase(repository: homeRepository()) }
    
}
