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
                    ZStack{
                        if let url = URL(string: activity.imageURLString ?? "") {
                            AsyncImage(url: url){ image in
                                image.image?
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(height: 150)
                                    .cornerRadius(15)
                            }
                        }
                        RoundedRectangle(cornerRadius: 16)
                            .frame(height: 150)
                            .frame(maxWidth: .infinity)
                            .foregroundColor(Color.black.opacity(0.2))
                        
                        Text( "\(activity.name ?? "H")" )
                            .foregroundColor(.white)
                            .font(.largeTitle)
                            .bold()
                    }
                    .cornerRadius(16)
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
    
}

struct ActivitiesView_Previews: PreviewProvider {
    static var previews: some View {
        ActivitiesView()
    }
}
