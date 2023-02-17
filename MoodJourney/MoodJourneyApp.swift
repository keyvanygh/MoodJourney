//
//  MoodJourneyApp.swift
//  MoodJourney
//
//  Created by Keyvan on 2/15/23.


import SwiftUI
import GoogleSignIn

@main
struct MoodJourneyApp: App {
    var body: some Scene {
        WindowGroup {
            SigninView()
                .onOpenURL { url in
                  GIDSignIn.sharedInstance.handle(url)
                }
        }
    }
}
