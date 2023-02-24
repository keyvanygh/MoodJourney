//
//  ReactionView.swift
//  MoodJourney
//
//  Created by Keyvan on 2/22/23.
//

import SwiftUI

struct ReactionView: View {
    @StateObject var vm = ReactionViewModel()
    var selectedFeeling: FeelingEntity?
    var body: some View {
        Button {
            guard let feeling = selectedFeeling else {return}
            print("HI IM HERE")
            vm.addReaction(gifURL: URL(string: ""), emoji: "", to: feeling)
        } label: {
            Text("Submit Reaction")
                .padding(32)
                .background(Color.green)
                .cornerRadius(16)
                .foregroundColor(.white)
        }

    }
}

struct ReactionView_Previews: PreviewProvider {
    static var previews: some View {
        ReactionView()
    }
}
