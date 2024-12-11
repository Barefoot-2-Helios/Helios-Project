//
//  CardCarouselView.swift
//  Helios - Project
//
//  Created by Letizia Granata on 10/12/24.
//
import SwiftUI

struct CardCarouselView: View {
    
    @StateObject private var viewModel = CardViewModel()
    @State private var selectedCardIndex = 0
    @State private var isPresentingFullScreenCover = false
    
    var body: some View {
        VStack {
            Spacer()
            ZStack {
                CardView(
                    card: viewModel.cards[selectedCardIndex],
                    onPrevious: {
                        withAnimation(.spring) {
                            selectedCardIndex = max(selectedCardIndex - 1, 0)
                        }
                    },
                    onNext: {
                        withAnimation(.spring) {
                            selectedCardIndex = min(selectedCardIndex + 1, viewModel.cards.count - 1)
                        }
                    },
                    isFirstCard: selectedCardIndex == 0,
                    isLastCard: selectedCardIndex == viewModel.cards.count - 1
                )
                .onTapGesture {
                    withAnimation {
                        isPresentingFullScreenCover = true
                    }
                }
            }
            HStack {
                ForEach(viewModel.cards.indices, id: \.self) { index in
                    Circle()
                        .fill(index == selectedCardIndex ? Color.black : Color.gray.opacity(0.5))
                        .frame(width: 10, height: 10)
                }
            }
            .padding(.top, 20)
            Spacer()
        }
        .fullScreenCover(isPresented: $isPresentingFullScreenCover) {
            Topic1View(card: viewModel.cards[selectedCardIndex])
            // //        }  .transaction { transaction in
            //            transaction.disablesAnimations = true
            //               
            //
            //        }
        }
    }
}


struct CardCarouselView_Previews: PreviewProvider {
    static var previews: some View {
        CardCarouselView ()
    }
}
