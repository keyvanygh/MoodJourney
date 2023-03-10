//
//  ActivitiesView.swift
//  MoodJourney
//
//  Created by Keyvan on 2/18/23.
//

import SwiftUI

struct ActivitiesView: View {
    @EnvironmentObject private var coordinator: Coordinator
    @StateObject var vm: ActivitiesViewModel
    private let url = URL(string: "https://www.appcoda.com")!
    private let photo = Image("tt2")

    var body: some View {

        VStack(alignment: .leading, spacing: 4) {
            Text("Goals")
                .font(.largeTitle)
                .bold()
                .padding(.leading, 16)
                .padding(.top, 8)
            Text("Profile")
                .onTapGesture {
                    guard let user = vm.user else {return}
                    coordinator.push(.profile(user: user))
                }
            ShareLink(item: url)
            ShareLink(item: photo, preview: SharePreview("Big Ben", image: photo))
            
            List {
                ForEach(vm.outputs.activities) { activity in
                    ZStack(alignment: .center) {
                        if let url = URL(string: activity.imageURLString ?? "") {
                            AsyncImage(url: url) { image in
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
                        coordinator.push(.feeling(activity: activity))
                    }
                }
                .listRowSeparator(.hidden)
            }
            .listRowBackground(Color.clear)
            .listStyle(.plain)
        }
        .onAppear {
            if vm.outputs.activities.isEmpty {
                vm.inputs.fetchActivies()
            }
        }
    }
}

struct ActivitiesView_Previews: PreviewProvider {
    static var testdbm = MockCoreDataManager()
    @StateObject static var coordinator = Coordinator()
    
    static var previews: some View {
        CoordinatorView(root: .activity(
            user: testdbm.previewUser!,
            activities: testdbm.previewActivities))
            .environmentObject(coordinator)
    }
}
