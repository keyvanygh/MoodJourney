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
        List {
            ForEach(vm.outputs.activities) { activity in
                Text("acticity: \(activity.name ?? "H")" )
            }
        }
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
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
