//
//  CheerleadersView.swift
//  MoodJourney
//
//  Created by Keyvan on 2/19/23.
//

import SwiftUI

struct CheerleadersView: View {
    @StateObject var vm: CheerleadersViewModel
    var body: some View {
        VStack{
            List{
                ForEach(vm.outputs.cheerLeaders){ cheerleader in
                    Text(cheerleader.userID ?? "")
                }
            }
            Button {
                vm.addCheerleader()
            } label: {
                Text("add cheears")
                    .frame(maxWidth: .infinity)
                    .background(Color.green)
                    .cornerRadius(16)
                    .padding(16)
                    .foregroundColor(.white)


                
            }

            Text("\(vm.outputs.cheerLeaders.count) people are cheering you on")
        }
        .onAppear(){
//            vm.addUser()
            vm.fetchCheerLeaders()
        }
    }
}

struct CheerleadersView_Previews: PreviewProvider {
    static var previews: some View {
        CheerleadersView(vm: CheerleadersViewModel())
    }
}
