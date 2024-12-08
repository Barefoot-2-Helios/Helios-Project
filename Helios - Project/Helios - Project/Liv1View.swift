//
//  Liv1View.swift
//  Helios - Project
//
//  Created by Letizia Granata on 07/12/24.
//

import SwiftUI
import AVFoundation

struct Liv1View: View {
    
    @Environment(PlayerModel.self) private var mediaPlayer
    @State private var audioPlayer: AVAudioPlayer?
    @State private var timer: Timer?
    @State private var showDetail = false
    @Environment(\.dismiss) var dismiss // Access to dismiss the view
    
    var body: some View {
        ZStack{
            Color.senape.ignoresSafeArea()
            VStack{
                HStack {
                    Button(action: {
                        dismiss()
                    }) {
                        Spacer()
                        HStack{
                            Image(systemName: "arrowtriangle.backward")
                                .font(.system(size: 70))
                                .foregroundColor(.white)
                        }
                        .padding(.trailing, 40)
                    }
                }
                Spacer()
                Text("Liv 1")
                    .fontWeight(.semibold)
                    .font(.system(size: 90))
                    .foregroundStyle(.white)
                
                Image("resistor")
                Text("Resistor")
                    .fontWeight(.semibold)
                    .font(.system(size: 90))
                    .foregroundStyle(.white)
                Spacer()
            }
        }
        .onAppear {
            startAudioPlayback()
        }
        .onDisappear {
            stopAudioPlayback()
        }
        .onTapGesture {
            stopAudioPlayback()
            showDetail = true
        }
        .fullScreenCover(isPresented: $showDetail) {
            MiniGame1()
        }
       
    }
    private func startAudioPlayback() {
        mediaPlayer.playAudio(fileName: "resistorAudio", fileExtension: "mp3")
        
        // Start a timer to play the audio every 5 seconds
        Timer.scheduledTimer(withTimeInterval: 3.0, repeats: true) { _ in
            DispatchQueue.main.async {
                mediaPlayer.audioPlayer?.play()
            }
        }
    }
    
    private func stopAudioPlayback() {
         timer?.invalidate() // Invalida il timer
         timer = nil // Rimuovi la reference al timer
         mediaPlayer.audioPlayer?.stop() // Ferma l'audio
         mediaPlayer.audioPlayer = nil // Libera il player per evitare conflitti
     }
}


#Preview {
    Liv1View()
}
