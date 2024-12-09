//
//  ContentView.swift
//  Helios - Project
//
//  Created by Beniamino Gentile on 09/12/24.
//

import SwiftUI

struct ContentView: View {
    @State var showSplash = true
    
    var body: some View {
        ZStack {
            TopicView()
            SplashScreenView()
                .opacity(showSplash ? 1 : 0)
                .onAppear {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                        withAnimation() {
                            self.showSplash = false
                        }
                    }
                }
        }
    }
}

#Preview {
    ContentView()
}
