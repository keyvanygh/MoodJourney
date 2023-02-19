//
//  AddFeelingView.swift
//  MoodJourney
//
//  Created by Keyvan on 2/17/23.
//

import SwiftUI

struct AddFeelingView: View {
    @StateObject var vm : AddFeelingViewModel
    var body: some View {
        VStack{
            HStack(spacing: 16){
                ForEach((1...3), id: \.self) { i in
                    ZStack{
                        Text("😂")
                            .zIndex(2)
                            .font(.system(.largeTitle))
                        RoundedRectangle(cornerRadius: 8)
                            .foregroundColor((i==vm.outputs.selectedFeelingIndex) ? Color.green : Color.gray.opacity(0.3) )
                            .frame(width: 80)
                            .frame(height: 80)
                    }.onTapGesture {
                        withAnimation {
                            vm.inputs.didSelectFeeling(atIndex: i)
                        }
                    }
                }
            }
            .padding(.horizontal,16)
            Button {
                vm.didTapSubmitButton()
            } label: {
                Text("Submit")
                    .foregroundColor(Color.white)
                    .frame(maxWidth: .infinity)
                    .frame(height: 44)
                    .font(.headline)
                    .background(Color.green)
                    .cornerRadius(8)
            }
            .padding(.horizontal,16)
        }

    }
}

struct AddFeelingView_Previews: PreviewProvider {
    static var previews: some View {
        AddFeelingView(vm: AddFeelingViewModel(activityID: ""))
    }
}
