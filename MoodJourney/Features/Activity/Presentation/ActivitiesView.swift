//
//  ActivitiesView.swift
//  MoodJourney
//
//  Created by sh on 2/18/23.
//

import SwiftUI

struct ActivitiesView: View {
    @StateObject var vm = ActivitiesViewModel()
    
    var body: some View {
        VStack{
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
                        Text( "\(activity.name ?? "H")" )
                            .foregroundColor(.white)
                            .font(.largeTitle)
                            .bold()
                    }
                }
            }
            .listRowBackground(Color.clear)
            .listRowSeparator(.hidden)
            .listStyle(.plain)
        }
        Text("")
            .onAppear(){
                vm.inputs.fetchActivies()
            }
    }
}



struct ActivitiesView_Previews: PreviewProvider {
    static var previews: some View {
        ActivitiesView()
    }
}
