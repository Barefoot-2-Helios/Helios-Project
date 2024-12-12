//
//  ContentView.swift
//  Helios - Project
//
//  Created by Renato Ferrara on 26/09/24.
//

import SwiftUI

struct SplashScreenView: View {
    
    var body: some View {
        ZStack {
            
            Image("background1")
                .resizable()
                .scaledToFill()
            VStack {
                Spacer()
                Text("Welcome to")
                    .fontWeight(.bold)
                    .font(.system(size: 80))
                    .foregroundStyle(.giallino)
                Spacer()
                Text("\nBRIGHT!")
                    .fontWeight(.bold)
                    .font(.system(size: 90))
                    .foregroundStyle(.giallino)
                
                Spacer()
                    
            }
           
        }
    }
}

#Preview {
    SplashScreenView()
}
