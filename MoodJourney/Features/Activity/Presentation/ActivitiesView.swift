//
//  ActivitiesView.swift
//  MoodJourney
//
//  Created by sh on 2/18/23.
//

import SwiftUI

struct ActivitiesView: View {
    @StateObject var vm = ActivitiesViewModel()
    @State var selection: String? = nil
    var body: some View {
        NavigationStack {
            
            VStack(alignment: .leading,spacing: 4){
                Text("Goals")
                    .font(.largeTitle)
                    .bold()
                    .padding(.leading,16)
                    .padding(.top,8)
                List {
                    ForEach(vm.outputs.activities) { activity in
                        ZStack(alignment: .center){
                            NavigationLink(destination: AddFeelingView(vm: AddFeelingViewModel(activityID: activity.activityID ?? "")), tag: activity.activityID ?? "", selection: $selection) { EmptyView() }

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
                            selection = activity.activityID
                        }
                    }
                    .listRowSeparator(.hidden)
                }
                .listRowBackground(Color.clear)
                .listStyle(.plain)
            }
            .onAppear(){
                vm.inputs.fetchActivies()
            }
        }
    }
}



struct ActivitiesView_Previews: PreviewProvider {
    static var previews: some View {
        ActivitiesView()
    }
}
