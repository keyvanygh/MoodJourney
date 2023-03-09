//
//  AddFeelingViewModel.swift
//  MoodJourney
//
//  Created by Keyvan on 2/17/23.
//

import Foundation
import Factory

class AddFeelingViewModel: AnyViewModel, AddFeelingViewModelInput, AddFeelingViewModelOutput {
    
    public var inputs: AddFeelingViewModelInput { return self }
    public var outputs: AddFeelingViewModelOutput { return self }
    @Injected(\.addFeelingToActivityUsecase) private(set) var addFeelingToActivityUsecase
    @Injected(\.fetchFeelingsForActivityUsecase) private(set) var fetchFeelingsForActivityUsecase
#if DEBUG
    @Injected(\.signinLocalDatasource) private var signinLocalDatasource
    @Injected(\.feelingLocalDatasource) private var  feelingLocalDatasource
    
#endif
    
    private var activity: ActivityEntity?
    init(activity: ActivityEntity) {
        self.activity = activity
    }
    init() {}
    
    // MARK: - Outputs
    @Published private(set) var selectedFeelingIndex: Int = 0
    @Published private(set) var feelings: [FeelingEntity] = []
    
    // MARK: - Inputs
    func didTapSubmitButton() {
        guard let activity = activity else {return}
        
        switch selectedFeelingIndex {
        case 1:
            _ = addFeelingToActivityUsecase(
                feeling: .sad,
                message: "",
                to: activity)
        case 2:
            _ = addFeelingToActivityUsecase(
                feeling: .happy,
                message: "",
                to: activity)
        case 3:
            _ = addFeelingToActivityUsecase(
                feeling: .depressed,
                message: "",
                to: activity)

        default:
            break
        }
        fetchFeelings()
    }
    func didSelectFeeling(atIndex index: Int) {
        selectedFeelingIndex = index
    }
    func fetchFeelings() {
        guard let activity = activity else {return}
        let result = fetchFeelingsForActivityUsecase(of: activity)
        switch result {
        case .success(let result):
            feelings = result
            
        case .failure: break
        }
    }
}
protocol AddFeelingViewModelInput {
    var addFeelingToActivityUsecase: AddFeelingToActivity { get }
    func didSelectFeeling(atIndex index: Int)
    func didTapSubmitButton()
    func fetchFeelings()
}
protocol AddFeelingViewModelOutput {
    var selectedFeelingIndex: Int { get }
    var feelings: [FeelingEntity] { get }
}

/*            guard let user = try? signinLocalDatasource.signin
 (with: .ThirdParty(.Google), userID: "TaraAsghari",
 name: "Tara",imageURLString: "https:i.pinimg.com/280x280_RS/89/da/dd/89dadd1c53a779cbac
 42be8ae9b7aca2.jpg") else {return }
 _ = try? feelingLocalDatasource.addFeelingHelper(feeling: Feeling
 .Happy.rawValue, message: "awsome", imageURLString: "", user: user, to: activity)
 */
