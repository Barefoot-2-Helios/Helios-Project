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
            Color.white
                .edgesIgnoringSafeArea(.all)
            
            VStack{
      
                ScrollView(.vertical) {
                    HStack {
                        ZStack {
                            Circle()
                                .foregroundStyle(card.cardBackground).frame(width: 220)
                                
                            VStack{
                                Text("Liv 1")
                                    .fontWeight(.medium)
                                    .font(.title)
                                Image("liv1")
                                    .padding(.top, 15)
                            }
                        }
                        .padding(.leading, 100)
                        
                        .onTapGesture {
                            showDetail = true
                        }
                        .navigationDestination(isPresented: $showDetail) {   SplashAppoggioView()}
                        Spacer()
                    }
                    HStack {
                        Spacer()
                        ZStack{
                            Circle()
                                .foregroundStyle(card.cardBackground)      .frame(width: 220)
                            VStack{
                                Text("Liv 2")
                                    .fontWeight(.medium)
                                    .font(.title)
                                Image("liv2")
                                    .padding(.top, 15)
                            }
                        }.padding(.trailing, 100)

                    }
                    HStack {
                        ZStack{
                            Circle()
                                .foregroundStyle(card.cardBackground).frame(width: 220)
                            VStack{
                                Text("Liv 3")
                                    .fontWeight(.medium)
                                    .font(.title)
                                Image("liv3")
                                    .padding(.top, 15)

                            }
                                
                        }.padding(.leading, 100)
                        Spacer()
                    }
                    HStack {
                        Spacer()
                        ZStack {
                            Circle()
                                .foregroundStyle(card.cardBackground)
                                .frame(width: 220)
                            VStack{
                                Text("Liv 4")
                                    .fontWeight(.medium)
                                    .font(.title)
                                Image("liv4")
                                    .padding(.top, 15)

                            }
                                
                        }.padding(.trailing, 100)
                    }
                    HStack {
                        ZStack {
                            Circle()
                                .foregroundStyle(card.cardBackground).frame(width: 220)
                            VStack{
                                Text("Liv 5")
                                    .fontWeight(.medium)
                                    .font(.title)
                                Image("liv5")
                                    .padding(.top, 15)

                            }
                        }.padding(.leading, 100)

                        Spacer()
                    }
            }
                    
                }

            }
        .navigationBarBackButtonHidden(true)
    .navigationBarItems(leading: BackButton( isForegroundWhite: true))
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
