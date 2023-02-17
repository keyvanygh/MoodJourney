//
//  ContentView.swift
//  MoodJourney
//
//  Created by Keyvan on 2/15/23.


import SwiftUI

struct SigninView: View {
    @StateObject var viewModel : SigninViewModel = SigninViewModel()
    var body: some View {
        VStack {
            SigninWithAppleButton(viewModel: viewModel)
                .frame(height : 44)
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        SigninView()
    }
}
