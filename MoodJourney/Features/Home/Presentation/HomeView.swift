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
                VStack(alignment: . leading){
                    HStack(spacing: 8){
                        if let imageURL = URL(string: feeling.user?.imageURLString ?? ""){
                            KFImage(imageURL)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width:50,height: 50)
                                .cornerRadius(25)
                        }
                        if let name = feeling.user?.name {
                            VStack(alignment: .leading, spacing: 4){
                                Text(name)
                                    .foregroundColor(.white)
                                    .font(.headline)
                                Text("Loose Weight")
                                    .font(.footnote)
                            }
                        }
                    }
                    Text("💪")
                    Text("Hey Guys I just had an amazing training, Cheer me on")
                    Image("tt2")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(maxWidth: .infinity)
                        .frame(height: 400)
                        .cornerRadius(16)
                    
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
