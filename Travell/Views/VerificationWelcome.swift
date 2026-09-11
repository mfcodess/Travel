//
//  VerificationWelcome.swift
//  Travel
//
//  Created by Максим  on 06.09.2026.
//

import SwiftUI

struct VerificationWelcome: View {
    
    @Binding var currentScreen: AppScreen
    
    @State private var cat1Jumping = false
    @State private var cat2Jumping = false
    @State private var showContent = false
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 0) {
            
            // MARK: - Header
            
            VStack(alignment: .leading, spacing: 10) {
                
                HStack(spacing: 8) {
                    Text("HELLO")
                        .font(.system(size: 13, weight: .bold, design: .rounded))
                        .tracking(3)
                        .foregroundStyle(
                            Color(
                                red: 108 / 255,
                                green: 99 / 255,
                                blue: 255 / 255
                            )
                        )
                    
                    Circle()
                        .fill(
                            Color(
                                red: 108 / 255,
                                green: 99 / 255,
                                blue: 255 / 255
                            )
                        )
                        .frame(width: 6, height: 6)
                }
                
                HStack(spacing: 0) {
                    Text("Welcome ")
                        .foregroundStyle(
                            Color(
                                red: 108 / 255,
                                green: 99 / 255,
                                blue: 255 / 255
                            )
                        )
                    
                    Text("Max")
                }
                .font(.system(size: 38, weight: .bold, design: .rounded))
                
                Text("Your journey starts here.")
                    .font(.system(size: 18, weight: .light, design: .rounded))
                    .foregroundStyle(.secondary)
            }
            .opacity(showContent ? 1 : 0)
            .offset(y: showContent ? 0 : -20)
            
            // MARK: - Cats
            
            ZStack {
                
                Image("WelcomeWallpaper1")
                    .resizable()
                    .scaledToFit()
                
                HStack(spacing: 40) {
                    
                    Image("CatOne")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 90)
                        .offset(x: -45, y: -48)
                        .offset(y: cat1Jumping ? -25 : 0)
                    
                    Image("CatTwo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 75)
                        .offset(x: 38, y: -45)
                        .offset(y: cat2Jumping ? -25 : 0)
                }
            }
            .padding(.top, 55)
            .opacity(showContent ? 1 : 0)
            .scaleEffect(showContent ? 1 : 0.95)
            
            // MARK: - Description
            
            VStack(alignment: .leading, spacing: 14) {
                
                HStack(spacing: 8) {
                    Image(systemName: "sparkles")
                        .font(.system(size: 16, weight: .semibold))
                        .foregroundStyle(
                            Color(
                                red: 108 / 255,
                                green: 99 / 255,
                                blue: 255 / 255
                            )
                        )
                    
                    Text("COMING SOON")
                        .font(.system(size: 13, weight: .bold, design: .rounded))
                        .tracking(1.5)
                }
                
                Text("A new part of your journey is currently under development. Stay tuned for Part 2.")
                    .font(.system(size: 18, weight: .light, design: .rounded))
                    .foregroundStyle(.secondary)
                    .fixedSize(horizontal: false, vertical: true)
            }
            .padding(.top, 45)
            .opacity(showContent ? 1 : 0)
            .offset(y: showContent ? 0 : 20)
            
            Spacer()
        }
        .padding(.horizontal, 38)
        .onAppear {
            
            withAnimation(.easeOut(duration: 0.7)) {
                showContent = true
            }
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.7) {
                withAnimation(
                    .easeInOut(duration: 0.5)
                    .repeatForever(autoreverses: true)
                ) {
                    cat1Jumping = true
                }
            }
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.2) {
                withAnimation(
                    .easeInOut(duration: 0.5)
                    .repeatForever(autoreverses: true)
                ) {
                    cat2Jumping = true
                }
            }
        }
    }
}

#Preview {
    VerificationWelcome(
        currentScreen: .constant(.verificationWelcome)
    )
}
