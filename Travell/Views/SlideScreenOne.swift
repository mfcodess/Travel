//
//  SlideScreenOne.swift
//  Travel
//
//  Created by Максим  on 10.08.2026.
//

import SwiftUI

struct SlideScreenOne: View {
    
    @State private var isVisible: Bool = false
    
    @Binding var currentScreen: AppScreen
    
    var body: some View {
        VStack {
//MARK: - КАРТИНКА
            ZStack {
                Image("HumanCarWallpaper")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 360, height: 220)
                    .padding(.top, 270)
                
                Image("BackPackWallpaper")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 50, height: 100)
                    .opacity(isVisible ? 1 : 0)
                    .animation(.easeInOut(duration: 1), value: isVisible)
                    .offset(x: 140, y: 180)
            }
            .task {
                try? await Task.sleep(for: .seconds(2.5))
                isVisible = true
            }
            Spacer()
//MARK: - ТЕКСТ
            VStack(alignment: .leading, spacing: 10) {
                
                Text("Travel the world easily")
                    .font(.system(size: 36, weight: .bold, design: .rounded))
                    .frame(width: 200, alignment: .leading)
                
                Text("To your desire")
                    .font(.system(size: 24, weight: .light, design: .rounded))
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.horizontal)
            
      
           
            
//MARK: - НИЖНИЕ КНОПКИ
            HStack {
                
                HStack(spacing: 5) {
                    Capsule()
                        .fill(.black)
                        .frame(width: 22, height: 7)
                    
                    Capsule()
                        .fill(Color(red: 108/255,green: 99/255,blue: 255/255))
                        .frame(width: 22, height: 7)
                    
                    Capsule()
                        .fill(Color(red: 108/255,green: 99/255,blue: 255/255))
                        .frame(width: 22, height: 7)
                }
                
                Spacer()
                
                Button {
                    currentScreen = .slideScreenTwo
                } label: {
                    ZStack {
                        Circle()
                            .fill(.black)
                            .frame(width: 70, height: 70)
                        
                        Circle()
                            .trim(from: 0.08, to: 0.40)
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
    SlideScreenOne(currentScreen: .constant(.slideScreenOne))
}
