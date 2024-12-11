//
//  CardView.swift
//  Helios - Project
//
//  Created by Letizia Granata on 10/12/24.
//

import SwiftUI

struct CardView: View {
    let card: Card
    var onPrevious: () -> Void
    var onNext: () -> Void
    var isFirstCard: Bool
    var isLastCard: Bool
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 25)
                .foregroundStyle(card.cardBackground)
                .frame(width: 600, height: 800)
            
            VStack {
                Text(card.cardLabel)
                    .font(.title)
                    .foregroundColor(.white)
                
                HStack {
                    ForEach(card.cardImage, id: \.self) { image in
                        Image(systemName: image)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 50, height: 50)
                            .foregroundColor(.white)
                    }
                }
                
                HStack {
                    Button(action: onPrevious) {
                        Image(systemName: "chevron.left")
                            .fontWeight(.bold)
                            .font(.system(size: 50))
                            .foregroundStyle(.white)
                            .opacity(isFirstCard ? 0 : 1)
                        
                    }
                    .disabled(isFirstCard)
                    .padding(.trailing, 220)
                    .padding(.bottom, 40)
                    
                    Button(action: onNext) {
                        Image(systemName: "chevron.right")
                            .fontWeight(.bold)
                            .font(.system(size: 50))
                            .foregroundStyle(.white)
                            .opacity(isLastCard ? 0 : 1)
                        
                    }
                    .disabled(isLastCard)
                    .padding(.leading, 220)
                    .padding(.bottom, 40)
                }
              
            }
            .padding()
            
        }
    }
}

// Preview Provider
struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(
            card: Card(
                cardLabel: "ciao",
                cardImage: ["house"],
                cardBackground: .senape
            ),
            onPrevious: {},
            onNext: {},
            isFirstCard: false,
            isLastCard: false
        )
        .previewLayout(.sizeThatFits)
        .padding()
    }
}
