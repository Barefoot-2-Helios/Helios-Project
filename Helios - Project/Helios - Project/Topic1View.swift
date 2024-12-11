//
//  Topic1View.swift
//  Helios - Project
//
//  Created by Letizia Granata on 07/12/24.
//

import SwiftUI

struct Topic1View: View {
    
    @Environment(\.dismiss) var dismiss // Access to dismiss the view
    @State private var showDetail = false
    @State private var isShowing = false

    var card: Card
    
    
    var body: some View {
        ZStack {
            card.cardBackground
                .edgesIgnoringSafeArea(.all)
            
            VStack{
                BackButton(isForegroundWhite: true)
      
                ScrollView(.vertical) {
                    HStack {
                        ZStack {
                            Circle()
                                .foregroundStyle(.white)
                                .frame(width: 220)
                                
                            VStack{
                                Text("Liv 1")
                                Image("liv1")
                            }
                        }
                        .padding(.leading, 100)
                        
                        .onTapGesture {
                            showDetail = true
                        }
                        .fullScreenCover(isPresented: $showDetail) {
                            MiniGame1()
                        }
                        Spacer()
                    }
                    HStack {
                        Spacer()
                        ZStack{
                            Circle()
                                .foregroundStyle(.white)
                                .frame(width: 220)
                            VStack{
                                Text("Liv 2")
                                Image("liv2")
                            }
                        }                                .padding(.trailing, 100)

                    }
                    HStack {
                        Circle()
                            .foregroundStyle(.white)
                            .frame(width: 220)
                            .padding(.leading, 100)
                        Spacer()
                    }
                    HStack {
                        Spacer()
                        Circle()
                            .foregroundStyle(.white
                            )
                            .frame(width: 220)
                            .padding(.trailing, 100)
                    }
                    HStack {
                        Circle()
                            .foregroundStyle(.white)
                            .frame(width: 220)
                            .padding(.leading, 100)
                        Spacer()
                    }
            }
                    
                }
            .transition(.scale.animation(.easeInOut))

            }
        .onAppear { isShowing = true }
               .onDisappear { isShowing = false }
        }
    }


#Preview {
    Topic1View(card: Card(
        cardLabel: "ciao",
        cardImage: ["house"],
        cardBackground: .senape
    ))
}
