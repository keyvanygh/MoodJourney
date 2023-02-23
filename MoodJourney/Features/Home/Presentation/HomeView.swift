//
//  HomeView.swift
//  MoodJourney
//
//  Created by sh on 2/22/23.
//

import SwiftUI

struct HomeView: View {
    @StateObject var vm: HomeViewModel
    var body: some View {
        Text("Hello, World!")
        List{
            ForEach(vm.feelings){ feeling in
                Text("HI")
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(vm: HomeViewModel())
    }
}
