//
//  HomeView.swift
//  MoodJourney
//
//  Created by sh on 2/22/23.
//

import SwiftUI
import Kingfisher
struct HomeView: View {
    @StateObject var vm: HomeViewModel
    var body: some View {
        List{
            ForEach(vm.feelings){ feeling in
                VStack{
                    HStack{
                        if let imageURL = URL(string: feeling.user?.imageURLString ?? ""){
                            KFImage(imageURL)
                                .onAppear(){
                                    print( feeling.user?.imageURLString)
                                }
       
                        }
                    }
                }
            }
            
        }.onAppear(){
            vm.fetchHomePage()
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(vm: HomeViewModel())
    }
}
