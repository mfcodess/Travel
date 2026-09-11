//
//  TravelApp.swift
//  Travel
//
//  Created by Максим  on 10.08.2026.
//

import SwiftUI
import FirebaseCore

@main
struct TravelApp: App {
    
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            RootView()
        }
    }
}
