//
//  Travel.swift
//  Travel
//
//  Created by Максим  on 10.08.2026.
//

import SwiftUI

struct Travel: View {
    
    @State private var isAnimating = false
    
    @Binding var currentScreen: AppScreen
    
    var body: some View {
        ZStack {
            
            Image("TravelWallpaper")
                .resizable()
                .ignoresSafeArea()
            
            VStack {
                Image("BalloonWallpaper")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 160, height: 160)
                    .offset(y: isAnimating ? -20 : 20)
                    .animation((.easeInOut(duration: 1.2).repeatForever(autoreverses: true)), value: isAnimating)
            }
            .offset(x: 60, y: -90)
            .onAppear {
                isAnimating = true
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                    currentScreen = .slideScreenOne
                    
                }
            }
        }
        
        
    }
}

#Preview {
    Travel(currentScreen: .constant(.slideScreenOne))
}

