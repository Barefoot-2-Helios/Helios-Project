//  Liv1View.swift
//  Helios - Project
//
//  Created by Letizia Granata on 07/12/24.
//

import SwiftUI
import AVFoundation

struct Liv2View: View {
    
    @Environment(PlayerModel.self) private var mediaPlayer
    @State private var audioPlayer: AVAudioPlayer?
    @State private var timer: Timer?
    @State private var showDetail = false
    @State private var isForegroundWhite = true
    @Environment(\.dismiss) var dismiss // Access to dismiss the view
    @State private var showTheView = false
    @StateObject private var viewModel = CardViewModel()
    @State private var selectedCardIndex = 0


    var body: some View {
        VStack{
            VStack(alignment: .center) {
                Spacer()
                // Titolo del livello
                Text("LEVEL 2")
                    .fontWeight(.bold)
                    .foregroundColor(.black)
                    .font(.system(size: 90))
                
                // Immagine del diodo
                Image("Resistor3D") // Assicurati che l'immagine si chiami "diodeImage" e sia nel tuo asset catalog
                    .resizable()
                    .scaledToFit()
                    .frame(width:300, height: 300)
                    .padding(90)// Dimensioni dell'immagine
                
                
                // Etichetta "DIODE"
                Text("RESISTOR")
                    .fontWeight(.bold)
                    .foregroundColor(.senape)
                    .font(.system(size: 80))
                Text("\n(Work in progress...)")
                    .fontWeight(.light)
                    .foregroundColor(.senape)
                    .font(.system(size: 80))
                Spacer()
            }
            // NavigationLink is triggered by showTheView
                         .background(
                             NavigationLink(
                                destination: Topic1View(card: viewModel.cards[selectedCardIndex]), // Replace with your actual Topic1View
                                 isActive: $showTheView,
                                 label: { EmptyView() }
                             )
                             .hidden()
                         )
                         .onTapGesture {
                             showTheView.toggle()
                         }
                     }
                     .navigationBarHidden(true) // Hide the navigation bar if not needed
                 }
    }


#Preview {
    Liv2View()
        .environment(PlayerModel())

}
