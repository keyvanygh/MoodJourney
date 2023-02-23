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
    
    private var activity: ActivityEntity? = nil
    init(activity: ActivityEntity) {
        self.activity = activity
    }
    init(){}
    
    // MARK: - Outputs
    @Published private(set) var selectedFeelingIndex: Int = 0
    @Published private(set) var feelings: [FeelingEntity] = []
    
    
    // MARK: - Inputs
    func didTapSubmitButton() {
        guard let activity = activity else{return}

        switch(selectedFeelingIndex){
        case 1:
            _ = addFeelingToActivityUsecase.execute(feeling: .Sad,message: "",to: activity)
            break
        case 2:
            _ = addFeelingToActivityUsecase.execute(feeling: .Happy,message: "",to: activity)
            break
        case 3:
            _ = addFeelingToActivityUsecase.execute(feeling: .Depressed,message: "",to: activity)
            break
        default :
            break
        }
        fetchFeelings()
    }
    func didSelectFeeling(atIndex index: Int) {
        selectedFeelingIndex = index
    }
    func fetchFeelings() {
        guard let activity = activity else {return}
        let result = fetchFeelingsForActivityUsecase.execute(of: activity)
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
