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
    
   
    // MARK: - Outputs
    @Published private(set) var selectedFeelingIndex: Int = 0

    
    // MARK: - Inputs
    func didTapSubmitButton() {
        _ = addFeelingToActivityUsecase.execute(activityID: "", feeling: .Happy, message: "")
    }
    func didSelectFeeling(atIndex index: Int) {
        selectedFeelingIndex = index
    }
}
protocol AddFeelingViewModelInput {
    var addFeelingToActivityUsecase : AddFeelingToActivityUsecase { get }
    func didSelectFeeling(atIndex index: Int)
    func didTapSubmitButton()
}
protocol AddFeelingViewModelOutput{
    var selectedFeelingIndex : Int { get }
}
