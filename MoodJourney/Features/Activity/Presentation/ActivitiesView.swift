//
//  ActivitiesView.swift
//  MoodJourney
//
//  Created by sh on 2/18/23.
//

import SwiftUI
//TODO: - User coordinator to navigate
struct ActivitiesView: View {
    @EnvironmentObject private var coordinator: Coordinator
    @StateObject var vm : ActivitiesViewModel
    var body: some View {
        
        VStack(alignment: .leading,spacing: 4){
            Text("Goals")
                .font(.largeTitle)
                .bold()
                .padding(.leading,16)
                .padding(.top,8)
            Text("Profile")
                .onTapGesture {
                    guard let user = vm.user else{return}
                    coordinator.push(.Profile(user: user))
                }
            List {
                ForEach(vm.outputs.activities) { activity in
                    ZStack(alignment: .center){
                        if let url = URL(string: activity.imageURLString ?? "") {
                            AsyncImage(url: url){ image in
                                image
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(height: 150, alignment: .center)
                                    .frame(maxWidth: .infinity)
                                    .clipShape(RoundedRectangle(cornerRadius: 16))
                            } placeholder: {
                                ProgressView()
                            }
                        }
                        RoundedRectangle(cornerRadius: 16)
                            .frame(height: 150, alignment: .center)
                            .frame(maxWidth: .infinity)
                            .foregroundColor(Color.black.opacity(0.05))
                        Text( "\(activity.name ?? "H")" )
                            .foregroundColor(.white)
                            .font(.largeTitle)
                            .bold()
                    }
                    .onTapGesture {
                        coordinator.push(.Feeling(activity: activity))
                    }
                }
                .listRowSeparator(.hidden)
            }
            .listRowBackground(Color.clear)
            .listStyle(.plain)
        }
        .onAppear(){
            if vm.outputs.activities.count == 0{
                vm.inputs.fetchActivies()
            }
        }
        
    }
}



struct ActivitiesView_Previews: PreviewProvider {
    static var previews: some View {
        ActivitiesView(vm: ActivitiesViewModel())
    }
}
