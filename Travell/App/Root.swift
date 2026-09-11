//
//  Root.swift
//  Travel
//
//  Created by Максим  on 10.08.2026.
//

import SwiftUI

struct RootView: View {
    
    @State private var currentScreen: AppScreen = .travel
    
    var body: some View {
        
        ZStack {
            switch currentScreen {
                
            case .travel:
                Travel(currentScreen: $currentScreen)
                    .transition(.opacity)
            case .slideScreenOne:
                SlideScreenOne(currentScreen: $currentScreen)
                    .transition(.opacity)
            case .slideScreenTwo:
                SlideScreenTwo(currentScreen: $currentScreen)
                
            case .slideScreenThree:
                SlideScreenThree(currentScreen: $currentScreen)
                
            case .createAccount:
                CreateAccount(currentScreen: $currentScreen)
                
            case .verification:
                Verification(currentScreen: $currentScreen)
                
            case .verificationWelcome:
                VerificationWelcome(currentScreen: $currentScreen)
            }
        }
        .animation(.easeInOut(duration: 0.5), value: currentScreen)
    }
}
