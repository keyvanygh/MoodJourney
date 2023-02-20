//
//  ContentView.swift
//  MoodJourney
//
//  Created by Keyvan on 2/15/23.


import SwiftUI

struct SigninView: View {
    @StateObject var viewModel : SigninViewModel = SigninViewModel()
    @EnvironmentObject private var coordinator:  Coordinator
    var body: some View {
        VStack {
            SigninWithAppleButton(vm: viewModel)
                .frame(height: 44)
                .padding(.top,188)
                .padding(.bottom,12)
                .padding(.horizontal,32)
            SigninWithGoogleButton(vm: viewModel)
                .frame(height: 44)
                .padding(.bottom,188)
            
        }
        .background(Color.green.ignoresSafeArea())
        .onChange(of: viewModel.outputs.user) { _ in
            guard let user = viewModel.outputs.user else {return}
            coordinator.push(.Activity(user: user))
        }        
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        SigninView()
    }
}
