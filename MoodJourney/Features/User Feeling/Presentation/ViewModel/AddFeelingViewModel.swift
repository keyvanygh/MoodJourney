//
//  AddFeelingViewModel.swift
//  MoodJourney
//
//  Created by Keyvan on 2/17/23.
//

import Foundation

class AddFeelingViewModel: AnyViewModel, AddFeelingViewModelInput,AddFeelingViewModelOutput {

    public var inputs: AddFeelingViewModelInput { return self }
    public var outputs: AddFeelingViewModelOutput { return self }

    @Published private(set) var selectedFeelingIndex: Int = 0

    func didTapSubmitButton() {
        print(selectedFeelingIndex)
    }
    func didSelectFeeling(atIndex index: Int) {
        selectedFeelingIndex = index
    }
}

public protocol AddFeelingViewModelInput {
    func didSelectFeeling(atIndex index: Int)
    func didTapSubmitButton()
}
protocol AddFeelingViewModelOutput{
    var selectedFeelingIndex : Int { get }
}
