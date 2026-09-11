//
//  SideScreenTqo.swift
//  Travel
//
//  Created by Максим  on 10.08.2026.
//

import SwiftUI

struct SlideScreenTwo: View {
    
    @State private var isVisible: Bool = false
    @State private var isVisibleTwo: Bool = false
    
    @Binding var currentScreen: AppScreen
    
    var body: some View {
        VStack {
//MARK: - КАРТИНКА
            ZStack {
                VStack {
                    HStack {
                        Button {
                            currentScreen = .slideScreenOne
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
               
                Image("HumanOneWallpaper")
                    .resizable()
                    .scaledToFit()
                    .frame(maxWidth: .infinity)
                    .padding(.horizontal, 20)
                    .padding(.top, 160)
                
                Image("HumanTwoWallpaper")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200, height: 160)
                    .opacity(isVisible ? 1 : 0)
                    .animation(.easeInOut(duration: 1), value: isVisible)
                    .offset(x: -70, y: 145)
                
                Image("HumanThreeWallpaper")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200, height: 160)
                    .opacity(isVisibleTwo ? 1 : 0)
                    .animation(.easeInOut(duration: 1), value: isVisibleTwo)
                    .offset(x: 140, y: 130)
            }
            .task {
                try? await Task.sleep(for: .seconds(2))
                isVisible = true

                try? await Task.sleep(for: .seconds(1))
                isVisibleTwo = true
            }
            Spacer()
//MARK: - ТЕКСТ
            VStack(alignment: .leading, spacing: 10) {
                
                Text("Reach the unknown spot")
                    .font(.system(size: 36, weight: .bold, design: .rounded))
                    .frame(width: 250, alignment: .leading)
                
                Text("To your destination")
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
                        .fill(.black)
                        .frame(width: 22, height: 7)
                    
                    Capsule()
                        .fill(Color(red: 108/255,green: 99/255,blue: 255/255))
                        .frame(width: 22, height: 7)
                }
                
                Spacer()
                
                Button {
                    currentScreen = .slideScreenThree
                } label: {
                    ZStack {
                        Circle()
                            .fill(.black)
                            .frame(width: 70, height: 70)
                        
                        Circle()
                            .trim(from: 0.08, to: 0.75)
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
    SlideScreenTwo(currentScreen: .constant(.slideScreenTwo))
}
