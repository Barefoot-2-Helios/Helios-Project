//
//  SplashAppoggioView.swift
//  Helios - Project
//
//  Created by Letizia Granata on 12/12/24.
//

import SwiftUI

struct SplashAppoggioView: View {
    
    @State var showSplash = true
    @StateObject private var viewModel = CardViewModel()
    @State private var selectedCardIndex = 0

    
    var body: some View {
        NavigationStack{
            ZStack {
                Topic1View(card: viewModel.cards[selectedCardIndex])
                Liv1View()
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
}
#Preview {
    SplashAppoggioView()
}
