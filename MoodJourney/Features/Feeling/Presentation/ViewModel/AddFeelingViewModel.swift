//
//  AddFeelingViewModel.swift
//  MoodJourney
//
//  Created by Keyvan on 2/17/23.
//

import Foundation
import Factory

class AddFeelingViewModel: AnyViewModel, AddFeelingViewModelInput,AddFeelingViewModelOutput {
    
    public var inputs: AddFeelingViewModelInput { return self }
    public var outputs: AddFeelingViewModelOutput { return self }
    @Injected(Container.addFeelingToActivityUsecase) private(set) var addFeelingToActivityUsecase
    @Injected(Container.fetchFeelingsForActivityUsecase) private(set) var fetchFeelingsForActivityUsecase

    private var activityID: String
    init(activityID: String) {
        self.activityID = activityID
    }
    
    // MARK: - Outputs
    @Published private(set) var selectedFeelingIndex: Int = 0
    @Published private(set) var feelings: [FeelingEntity] = []

    
    // MARK: - Inputs
    func didTapSubmitButton() {
        _ = addFeelingToActivityUsecase.execute(activityID: activityID, feeling: .Depressed,message: "HI GOOZOO")
    }
    func didSelectFeeling(atIndex index: Int) {
        selectedFeelingIndex = index
    }
    func fetchFeelings() {
        let result = fetchFeelingsForActivityUsecase.execute(activityID: activityID)
        switch result {
        case .success(let result):
            feelings = result
            break
        case .failure(_): break
        }
    }
}
protocol AddFeelingViewModelInput {
    var addFeelingToActivityUsecase : AddFeelingToActivityUsecase { get }
    func didSelectFeeling(atIndex index: Int)
    func didTapSubmitButton()
    func fetchFeelings()
}
protocol AddFeelingViewModelOutput {
    var selectedFeelingIndex : Int { get }
    var feelings: [FeelingEntity] { get }
}
