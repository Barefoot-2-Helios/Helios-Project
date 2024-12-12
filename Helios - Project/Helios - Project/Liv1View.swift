//
//  Liv1View.swift
//  Helios - Project
//
//  Created by Letizia Granata on 07/12/24.
//

import SwiftUI
import AVFoundation

struct Liv1View: View {
    @State private var showDetail = false
    
    var body: some View {
        VStack{
            VStack(alignment: .center) {
                // Titolo del livello
                Text("LEVEL 1")
                    .fontWeight(.bold)
                    .foregroundColor(.black)
                    .font(.system(size: 90))
                
                
                // Immagine del diodo
                Image("Diode3D") // Assicurati che l'immagine si chiami "diodeImage" e sia nel tuo asset catalog
                    .resizable()
                    .scaledToFit()
                    .frame(width:3700, height: 370)
                    .padding(90)// Dimensioni dell'immagine
                
                
                // Etichetta "DIODE"
                Text("DIODE")
                    .fontWeight(.bold)
                    .foregroundColor(.senape)
                    .font(.system(size: 80))
                
            }
        }
          
                .navigationDestination(isPresented: $showDetail) { MiniGame1()}
                .onAppear(){
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                        self.showDetail.toggle()
                    }
                }
            
        }
        
    
    
}
#Preview {
    Liv1View()
  

}
