//
//  SlideScreenThree.swift
//  Travel
//
//  Created by Максим  on 10.08.2026.
//

import SwiftUI

struct SlideScreenThree: View {
    
    @State private var isVisible: Bool = false
    
    @Binding var currentScreen: AppScreen
    
    var body: some View {
        VStack {
//MARK: - КАРТИНКА
            ZStack {
                VStack {
                    HStack {
                        Button {
                            currentScreen = .slideScreenTwo
                        } label: {
                            Image(systemName: "chevron.left")
                                .font(.system(size: 20, weight: .bold))
                                .foregroundStyle(.black)
                                .frame(width: 45, height: 45)
                                .background(.white)
                                .clipShape(Circle())
                        }
                        Spacer()
                    }
                    Spacer()
                }
                Image("HumanFourWallpaper")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 370, height: 240)
                    .padding(.top, 120)
                
                Image("BackPackTwoWallpaper")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 40, height: 90)
                    .opacity(isVisible ? 1 : 0)
                    .animation(.easeInOut(duration: 1), value: isVisible)
                    .offset(x: -104, y: 141)
            }
            .task {
                try? await Task.sleep(for: .seconds(2.5))
                isVisible = true
            }
            
            Spacer()
//MARK: - ТЕКСТ
            VStack(alignment: .leading, spacing: 10) {
                
                Text("Make connects with travel")
                    .font(.system(size: 36, weight: .bold, design: .rounded))
                    .frame(width: 300, alignment: .leading)
                
                Text("To your dream trip")
                    .font(.system(size: 24, weight: .light, design: .rounded))
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.horizontal)
            
//MARK: - НИЖНИЕ КНОПКИ
            HStack {
                HStack(spacing: 5) {
                    Capsule()
                        .fill(Color(red: 108/255,green: 99/255,blue: 255/255))
                        .frame(width: 22, height: 7)
                    
                    Capsule()
                        .fill(Color(red: 108/255,green: 99/255,blue: 255/255))
                        .frame(width: 22, height: 7)
                    
                    Capsule()
                        .fill(.black)
                        .frame(width: 22, height: 7)
                }
                
                Spacer()
                
                Button {
                    currentScreen = .createAccount
                } label: {
                    ZStack {
                        Circle()
                            .fill(.black)
                            .frame(width: 70, height: 70)
                        
                        Circle()
                            //.trim(from: 0.08, to: 5)
                            .stroke(.black, lineWidth: 4)
                            .frame(width: 82, height: 82)
                            .rotationEffect(.degrees(-120))
                        
                        Image(systemName: "chevron.right")
                            .font(.system(size: 24, weight: .medium))
                            .foregroundStyle(.white)
                    }
                }

            }
            .padding(.horizontal)
            .padding(.bottom, 50)
        }
    }
}

#Preview {
    SlideScreenThree(currentScreen: .constant(.slideScreenThree))
}
