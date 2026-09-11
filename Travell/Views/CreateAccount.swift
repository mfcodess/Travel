//
//  CreateAccount.swift
//  Travel
//
//  Created by Максим  on 16.08.2026.
//
import SwiftUI
import FirebaseAuth

struct CreateAccount: View {
    
    @Binding var currentScreen: AppScreen
    
    @State private var isVisible: Bool = false
    
    //подключилViewModel
    @StateObject private var viewModel = CreateAccountViewModel()
    
    var body: some View {
        
        VStack {
            
            // MARK: - Верхняя часть
            ZStack {
                
                Image("MapWallpaper")
                    .resizable()
                    .scaledToFit()
                    .offset(x: 65)
                
                VStack(spacing: 10) {
                    
                    Text("Get Started")
                        .font(.system(
                            size: 36,
                            weight: .semibold,
                            design: .rounded
                        ))
                    
                    Text("by creating a free account.")
                        .font(.system(
                            size: 20,
                            weight: .light,
                            design: .rounded
                        ))
                }
                .padding(.top, 60)
                
                Image("LineWallpaper")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 240, height: 200)
                    .opacity(isVisible ? 1 : 0)
                    .animation(
                        .easeInOut(duration: 1),
                        value: isVisible
                    )
                    .offset(x: 0, y: -35)
            }
            .frame(height: 230)
            
            
            Spacer()
            
            
            // MARK: - TextFields
            VStack(spacing: 25) {
                
                //TextField работают через Binding
                
                
                TextField("Full name", text: $viewModel.fullName)
                    .font(.system(size: 14, weight: .light, design: .rounded))
                    .padding(.horizontal, 16)
                    .overlay(alignment: .trailing) {
                        Image(systemName: "person")
                            .font(.system(size: 20, weight: .light))
                            .foregroundStyle(.gray)
                            .padding(.trailing, 16)
                    }
                    .frame(height: 60)
                    .background(Color.gray.opacity(0.12))
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                
                
                TextField("Valid email", text: $viewModel.email)
                    .font(.system(size: 14, weight: .light, design: .rounded))
                    .keyboardType(.emailAddress)
                    .textInputAutocapitalization(.never)
                    .padding(.horizontal, 16)
                    .overlay(alignment: .trailing) {
                        Image(systemName: "envelope")
                            .font(.system(size: 20, weight: .light))
                            .foregroundStyle(.gray)
                            .padding(.trailing, 16)
                    }
                    .frame(height: 60)
                    .background(Color.gray.opacity(0.12))
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                
                
                TextField("Phone number", text: $viewModel.number)
                    .font(.system(size: 14, weight: .light, design: .rounded))
                    .keyboardType(.phonePad)
                    .padding(.horizontal, 16)
                    .overlay(alignment: .trailing) {
                        Image(systemName: "iphone")
                            .font(.system(size: 20, weight: .light))
                            .foregroundStyle(.gray)
                            .padding(.trailing, 16)
                    }
                    .frame(height: 60)
                    .background(Color.gray.opacity(0.12))
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                
                
                SecureField("Strong Password", text: $viewModel.password)
                    .font(.system(size: 14, weight: .light, design: .rounded))
                    .padding(.horizontal, 16)
                    .overlay(alignment: .trailing) {
                        Image(systemName: "lock")
                            .font(.system(size: 20, weight: .light))
                            .foregroundStyle(.gray)
                            .padding(.trailing, 16)
                    }
                    .frame(height: 60)
                    .background(Color.gray.opacity(0.12))
                    .clipShape(RoundedRectangle(cornerRadius: 20))
            }
            .padding(.horizontal, 38)
            
            Button {
                viewModel.isChecked.toggle()
            } label: {
                HStack {
                    Image(systemName:  viewModel.isChecked ? "checkmark.square.fill" : "square")
                        .font(.system(size: 22))
                        .foregroundStyle(viewModel.isChecked ? Color(red: 108/255, green: 99/255, blue: 255/255): .gray)
                    
                    Text("By checking the box you agree to our \(Text("Terms").foregroundStyle(Color(red: 108/255, green: 99/255, blue: 255/255))) and \(Text("Conditions").foregroundStyle(Color(red: 108/255, green: 99/255, blue: 255/255))).")
                        .font(.system(size: 14))
                        .foregroundStyle(.gray)
                    
                }
                .padding(.horizontal, 38)
            }
            .buttonStyle(.plain)
            
            Spacer()
            
            
            // MARK: - Buttons
            VStack(spacing: 15) {
                
                Button {
                    
                    
                    viewModel.validateForm()
                    
                    if viewModel.isFormValid {
                        register()
                        currentScreen = .verification
                    }
                    
                } label: {
                    Text("Next")
                        .font(.system(size: 20,weight: .semibold,design: .rounded))
                        .foregroundStyle(.white)
                        .frame(maxWidth: .infinity)
                        .frame(height: 60)
                    
                        .background(viewModel.isFormValid ? Color(red: 108 / 255,green: 99 / 255, blue: 255 / 255) : Color.gray)
                        .clipShape(RoundedRectangle(cornerRadius: 20))
                    
                    
                }
                
                HStack {
                    Text("Already have an account?")
                        .font(.system(.body, design: .rounded))
                        .bold()
                    
                    Button {
                        
                    } label: {
                        Text("Sign in")
                            .font(.system(.body, design: .rounded))
                            .bold()
                            .foregroundStyle(
                                Color(red: 108 / 255,green: 99 / 255,blue: 255 / 255))
                            .underline()
                    }
                }
            }
            .padding(.horizontal, 38)
            
            
            Spacer()
        }
        
        .task {
            try? await Task.sleep(for: .seconds(2.5))
            isVisible = true
        }
        
        .alert("", isPresented: $viewModel.showError) {
            Button("Ok", role: .cancel) {}
        } message: {
            Text(viewModel.errorMessage)
        }
    }
    func register() {
        Auth.auth().createUser(
            withEmail: viewModel.email,
            password: viewModel.password
        ) { result, error in
            
            if let error = error {
                print("Ошибка регистрации: \(error.localizedDescription)")
                return
            }
            
            guard let user = result?.user else {
                return
            }
            
            user.sendEmailVerification { error in
                
                if let error = error {
                    print("Ошибка отправки письма: \(error.localizedDescription)")
                } else {
                    print("Письмо для подтверждения отправлено")
                    
                    DispatchQueue.main.async {
                        currentScreen = .verification
                    }
                }
            }
        }
    }
}

#Preview {
    CreateAccount(currentScreen: .constant(.createAccount))
}
