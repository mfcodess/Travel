//
//  Verification.swift
//  Travel
//
//  Created by Максим  on 05.09.2026.
//

import SwiftUI
import FirebaseAuth

struct Verification: View {
    
    @Binding var currentScreen: AppScreen
    
    @State private var showError = false
    @State private var errorMessage = ""
    
    var body: some View {
        
        VStack(spacing: 0) {
            
            // MARK: - Top content
            
            VStack(spacing: 24) {
                
                // Email icon
                ZStack {
                    Circle()
                        .fill(
                            Color(red: 108 / 255,
                                  green: 99 / 255,
                                  blue: 255 / 255)
                            .opacity(0.12)
                        )
                        .frame(width: 90, height: 90)
                    
                    Image(systemName: "envelope.fill")
                        .font(.system(size: 36))
                        .foregroundStyle(
                            Color(red: 108 / 255,
                                  green: 99 / 255,
                                  blue: 255 / 255)
                        )
                }
                .padding(.top, 30)
                
                VStack(spacing: 14) {
                    
                    Text("Check your email")
                        .font(
                            .system(
                                size: 34,
                                weight: .bold,
                                design: .rounded
                            )
                        )
                        .multilineTextAlignment(.center)
                    
                    Text(
                        "We've sent a verification link to your email. Please check your inbox and verify your account."
                    )
                    .font(
                        .system(
                            size: 18,
                            weight: .regular,
                            design: .rounded
                        )
                    )
                    .foregroundStyle(.secondary)
                    .multilineTextAlignment(.center)
                    .lineSpacing(5)
                    .fixedSize(horizontal: false, vertical: true)
                }
            }
        
            //Spacer()
            
            // MARK: - Buttons
            
            VStack(spacing: 16) {
                
                Button {
                    currentScreen = .verificationWelcome
                } label: {
                    Text("I've verified my email")
                        .font(
                            .system(
                                size: 18,
                                weight: .semibold,
                                design: .rounded
                            )
                        )
                        .foregroundStyle(.white)
                        .frame(maxWidth: .infinity)
                        .frame(height: 60)
                        .background(
                            Color(
                                red: 108 / 255,
                                green: 99 / 255,
                                blue: 255 / 255
                            )
                        )
                        .clipShape(
                            RoundedRectangle(cornerRadius: 18)
                        )
                }
                
                Button {
                    currentScreen = .verificationWelcome
                } label: {
                    HStack(spacing: 8) {
                        Image(systemName: "arrow.clockwise")
                        
                        Text("Resend email")
                    }
                    .font(
                        .system(
                            size: 16,
                            weight: .semibold,
                            design: .rounded
                        )
                    )
                    .foregroundStyle(
                        Color(
                            red: 108 / 255,
                            green: 99 / 255,
                            blue: 255 / 255
                        )
                    )
                    .frame(maxWidth: .infinity)
                    .frame(height: 50)
                    .background(
                        Color(
                            red: 108 / 255,
                            green: 99 / 255,
                            blue: 255 / 255
                        )
                        .opacity(0.08)
                    )
                    .clipShape(
                        RoundedRectangle(cornerRadius: 16)
                    )
                }
            }
            .padding(.top, 50)
            Spacer()
            
            // MARK: - Back
            HStack {
                Button {
                    currentScreen = .createAccount
                } label: {
                    HStack(spacing: 8) {
                        Image(systemName: "chevron.left")
                            .font(.system(size: 14, weight: .semibold))
                        
                        Text("Back")
                            .font(
                                .system(
                                    size: 16,
                                    weight: .medium,
                                    design: .rounded
                                )
                            )
                    }
                    .foregroundStyle(.black)
                }
                Spacer()
            }
            
             .padding(.bottom, 20)
        }
        .padding(.horizontal, 30)
        .alert("Verification", isPresented: $showError) {
            Button("OK", role: .cancel) {}
        } message: {
            Text(errorMessage)
        }
            
    }
    
    // MARK: - Check verification
    
    func checkEmailVerification() {
        guard let user = Auth.auth().currentUser else {
            errorMessage = "User not found."
            showError = true
            return
        }
        
        user.reload { error in
            
            if let error = error {
                errorMessage = error.localizedDescription
                showError = true
                return
            }
            
            if user.isEmailVerified {
                print("Email подтверждён")
                currentScreen = .verificationWelcome
            } else {
                errorMessage = "Please verify your email first."
                showError = true
            }
        }
    }
    
    // MARK: - Resend email
    
    func resendVerificationEmail() {
        Auth.auth().currentUser?.sendEmailVerification { error in
            
            if let error = error {
                errorMessage = error.localizedDescription
                showError = true
            } else {
                print("Verification email sent again")
            }
        }
    }
}

#Preview {
    Verification(currentScreen: .constant(.verification))
}
