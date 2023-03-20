//
//  Container+extension.swift
//  MoodJourney
//
//  Created by Keyvan on 2/17/23.
//

import Foundation
import Factory

extension Container {
    
    var dbm: Factory<CoreDataManager> {
        self { CoreDataManagerImp()  }
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
        self { [self] in FeelingLocalDatasource(dbm: dbm(), acm: acm())  }
    }
    var feelingRepository: Factory<any FeelingRepository> {
        self { [self] in FeelingRepositoryImp(localDatasource: feelingLocalDatasource())  }
    }
    var addFeelingToActivityUsecase: Factory<AddFeelingToActivity> {
        self { [self] in AddFeelingToActivity(repository: feelingRepository())  }
    }
    var fetchFeelingsOfActivity: Factory<FetchFeelingsOfActivity> {
        self { [self] in FetchFeelingsOfActivity(repository: feelingRepository())  }
    }
    var addFeelingViewModel: Factory<AddFeelingViewModel> {
        self {AddFeelingViewModel()}
    }
    
    // MARK: - Activity :
    var activityLocalDatasource: Factory<ActivityLocalDatasource> {
        self { [self] in ActivityLocalDatasource(dbm: dbm())  }
    }
    var activityRepository: Factory<any ActivityRepository> {
        self { [self] in ActivityRepositoryImp(lds: activityLocalDatasource())  }
    }
    var fetchActivitiesUsecase: Factory<FetchActivities> {
        self { [self] in FetchActivities(repository: activityRepository())  }
    }
    
    // MARK: - Cheerleaders :
    var cheerLeadersLocalDatasource: Factory<CheerleadersLocalDatasource> {
        self { [self] in CheerleadersLocalDatasource(dbm: dbm())  }
    }
    var cheerLeadersRepository: Factory<CheerleadersRepository> {
        self { [self] in CheerleadersRepositoryImp(lds: cheerLeadersLocalDatasource())  }
    }
    var fetchCheerleaders: Factory<FetchCheerleaders> {
        self { [self] in FetchCheerleaders(repository: cheerLeadersRepository())  }
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
    var signinWithApple: Factory<SigninWithApple> {
        self { [self] in SigninWithApple(repository: signinRepository())  }
    }
    var fetchUserByID: Factory<FetchUserByID> {
        self { [self] in FetchUserByID(repository: signinRepository())  }
    }
    var fetchUserIDFromKeychain: Factory<FetchUserIDFromKeychain> {
        self { [self] in FetchUserIDFromKeychain(repository: signinRepository())  }
    }
    var signinViewModel: Factory<SigninViewModelImp> {
        self { [self] in SigninViewModelImp(
            signinWithGoogle: signinWithGoogle(),
            signinWithApple: signinWithApple()
        )}
    }
    
    // MARK: - Reaction :
    var reactionLocalDatasource: Factory<ReactionLocalDatasource> {
        self { [self] in ReactionLocalDatasource(dbm: dbm())  }
    }
    var reactionRepository: Factory<ReactionRepository> {
        self { [self] in ReactionRepositoryImp(lds: reactionLocalDatasource())  }
    }
    var addReactionToFeeling: Factory<AddReactionToFeeling> {
        self { [self] in AddReactionToFeeling(repository: reactionRepository())  }
    }
    
    // MARK: - Home :
    
    var homeLocalDatasource: Factory<HomeLocalDatasource> {
        self { HomeLocalDatasource()  }
    }
    var homeRepository: Factory<HomeRepository> {
        self { [self] in HomeRepositoryImp(lds: homeLocalDatasource())  }
    }
    var fetchHome: Factory<FetchHome> {
        self { [self] in FetchHome(repository: homeRepository())  }
    }
}
