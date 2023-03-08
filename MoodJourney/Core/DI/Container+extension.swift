//
//  Container+extension.swift
//  MoodJourney
//
//  Created by Keyvan on 2/17/23.
//

import Foundation
import Factory

extension Container {
    
    var dbm: Factory<DatabaseManager> {
        self { DatabaseManager()  }
            .singleton
    }
    var kcm: Factory<KeychainManager> {
        self { KeychainManager()  }
            .singleton
    }
    var acm: Factory<AccountManager> {
        self { AccountManager()  }
            .singleton
    }
    
    // MARK: - Feelings :
    var feelingLocalDatasource: Factory<FeelingLocalDatasource> {
        self { FeelingLocalDatasource()  }
    }
    var feelingRepository: Factory<FeelingRepository> {
        self { [self] in FeelingRepositoryImp(localDatasource: feelingLocalDatasource())  }
    }
    var addFeelingToActivityUsecase: Factory<AddFeelingToActivityUsecase> {
        self { [self] in AddFeelingToActivityUsecase(repository: feelingRepository())  }
    }
    var fetchFeelingsForActivityUsecase: Factory<FetchFeelingsForActivityUsecase> {
        self { [self] in FetchFeelingsForActivityUsecase(repository: feelingRepository())  }
    }
    var addFeelingViewModel: Factory<AddFeelingViewModel> {
        self {AddFeelingViewModel()}
    }
    
    // MARK: - Activity :
    var activityLocalDatasource: Factory<ActivityLocalDatasource> {
        self { ActivityLocalDatasource()  }
    }
    var activityRepository: Factory<ActivityRepository> {
        self { [self] in ActivityRepositoryImp(localDs: activityLocalDatasource())  }
    }
    var fetchActivitiesUsecase: Factory<FetchActivitiesUsecase> {
        self { [self] in FetchActivitiesUsecase(repository: activityRepository())  }
    }
    
    // MARK: - Cheerleaders :
    var cheerLeadersLocalDatasource: Factory<CheerleadersLocalDatasource> {
        self { CheerleadersLocalDatasource()  }
    }
    var cheerLeadersRepository: Factory<CheerleadersRepository> {
        self { [self] in CheerleadersRepositoryImp(lds: cheerLeadersLocalDatasource())  }
    }
    var fetchCheerleadersUsecase: Factory<FetchCheerleadersUsecase> {
        self { [self] in FetchCheerleadersUsecase(repository: cheerLeadersRepository())  }
    }
    
    // MARK: - Signin :
    var signinLocalDatasource: Factory<SigninLocalDatasource> {
        self { SigninLocalDatasource()  }
    }
    var signinRemoteDataSource: Factory<SigninRemoteDataSource> {
        self { SigninRemoteDataSource(networkManager: NetworkManagerImp(willSucceed: true))  }
    }
    var signinRepository: Factory<any SigninRepository> {
        self { [self] in SigninRepositoryImp(
            rds: signinRemoteDataSource(),
            lds: signinLocalDatasource()) }
    }
    var signinWithGoogle: Factory<SigninWithGoogle> {
        self { [self] in SigninWithGoogle(repository: signinRepository())  }
    }
    var fetchUserByIDUsecase: Factory<FetchUserByIDUsecase> {
        self { [self] in FetchUserByIDUsecase(repository: signinRepository())  }
    }
    var fetchUserIDFromKeychainUsecase: Factory<FetchUserIDFromKeychainUsecase> {
        self { [self] in FetchUserIDFromKeychainUsecase(repository: signinRepository())  }
    }
    var signinViewModel: Factory<any SigninViewModel> {
        self { [self] in SigninViewModelImp(signinWithGoogle: signinWithGoogle())}
    }
    
    // MARK: - Reaction :
    var reactionLocalDatasource: Factory<ReactionLocalDatasource> {
        self { ReactionLocalDatasource()  }
    }
    var reactionRepository: Factory<ReactionRepository> {
        self { [self] in ReactionRepositoryImp(lds: reactionLocalDatasource())  }
    }
    var addReactionToFeelingUsecase: Factory<AddReactionToFeelingUsecase> {
        self { [self] in AddReactionToFeelingUsecase(repository: reactionRepository())  }
    }
    
    // MARK: - Home :
    
    var homeLocalDatasource: Factory<HomeLocalDatasource> {
        self { HomeLocalDatasource()  }
    }
    var homeRepository: Factory<HomeRepository> {
        self { [self] in HomeRepositoryImp(lds: homeLocalDatasource())  }
    }
    var fetchHomeUsecase: Factory<FetchHomeUsecase> {
        self { [self] in FetchHomeUsecase(repository: homeRepository())  }
    }
}
